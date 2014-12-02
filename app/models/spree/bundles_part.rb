module Spree
  class BundlesPart < ActiveRecord::Base
    belongs_to :bundle, :class_name => "Spree::Product", :foreign_key => "bundle_id"
    belongs_to :part, :class_name => "Spree::Product", :foreign_key => "part_id"

    def self.get(bundle_id, part_id)
      find_by_bundle_id_and_part_id(bundle_id, part_id)
    end

    def save
      self.class.where(["bundle_id = ? AND part_id = ?", bundle_id, part_id]).update_all("count = #{count}")
    end

    def destroy
      self.class.where(["bundle_id = ? AND part_id = ?", bundle_id, part_id]).delete_all()
    end
  end
end
