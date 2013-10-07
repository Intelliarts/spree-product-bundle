class AddPartsFieldsToProducts < ActiveRecord::Migration
  def self.up
    change_table(:spree_products) do |t|
      t.column :can_be_bundled, :boolean, :default => false, :null => false
      t.column :only_in_bundle, :boolean, :default => false, :null => false
    end
  end

  def self.down
    change_table(:spree_products) do |t|
      t.remove :can_be_bundled
      t.remove :only_in_bundle
    end
  end
end
