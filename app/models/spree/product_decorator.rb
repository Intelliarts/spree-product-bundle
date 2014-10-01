Spree::Product.class_eval do
  has_and_belongs_to_many  :parts, :class_name => "Spree::Product",
        :join_table => "spree_bundles_parts",
        :foreign_key => "bundle_id", :association_foreign_key => "part_id"

  has_and_belongs_to_many  :bundles, :class_name => "Spree::Product",
                           :join_table => "spree_bundles_parts",
                           :foreign_key => "part_id", :association_foreign_key => "bundle_id"

  has_many :bundles_parts, :class_name => "Spree::BundlesPart",
    :foreign_key => "bundle_id"

  scope :bundles, -> { joins(:parts) }

  scope :search_can_be_bundled, ->(query){ not_deleted.available.joins(:master)
    .where(arel_table["name"].matches("%#{query}%"))
    .where(can_be_bundled: true)
    .limit(30)
  }

  validate :bundle_cannot_be_part, :if => :bundle?

  def bundles_for(products)
    bundles.where(id: products)
  end

  def part?
    bundles.exists?
  end

  def add_part(product, count = 1)
    ap = Spree::BundlesPart.get(self.id, product.id)
    if ap
      ap.count += count
      ap.save
    else
      self.parts << product
      set_part_count(product, count) if count > 1
    end
  end

  def remove_part(product)
    ap = Spree::BundlesPart.get(self.id, product.id)
    unless ap.nil?
      ap.count -= 1
      if ap.count > 0
        ap.save
      else
        ap.destroy
      end
    end
  end

  def set_part_count(product, count)
    ap = Spree::BundlesPart.get(self.id, product.id)
    unless ap.nil?
      if count > 0
        ap.count = count
        ap.save
      else
        ap.destroy
      end
    end
  end

  def bundle?
    parts.present?
  end

  def count_of(product)
    ap = Spree::BundlesPart.get(self.id, product.id)
    ap ? ap.count : 0
  end

  def bundle_cannot_be_part
    errors.add(:can_be_bundled, Spree.t(:bundle_cannot_be_part)) if can_be_bundled
  end
end
