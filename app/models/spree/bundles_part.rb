module Spree
  class BundlesPart < ActiveRecord::Base
    belongs_to :bundle, :class_name => "Spree::Product", :foreign_key => "bundle_id"
    belongs_to :part, :class_name => "Spree::Product", :foreign_key => "part_id"

    def self.get(bundle_id, part_id)
      find_by_bundle_id_and_part_id(bundle_id, part_id)
    end

    def save
      self.class.update_all("count = #{count}", ["bundle_id = ? AND part_id = ?", bundle_id, part_id])
    end

    def destroy
      self.class.delete_all(["bundle_id = ? AND part_id = ?", bundle_id, part_id])
    end
  end
end
