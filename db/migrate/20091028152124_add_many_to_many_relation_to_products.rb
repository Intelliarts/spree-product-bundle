class AddManyToManyRelationToProducts < ActiveRecord::Migration
  def self.up
    create_table :spree_bundles_parts, :id => false do |t|
      t.integer "bundle_id", :null => false
      t.integer "part_id", :null => false
      t.integer "count", :null => false, :default => 1
    end
  end

  def self.down
    drop_table :spree_bundles_parts
  end
end
