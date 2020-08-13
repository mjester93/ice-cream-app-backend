class CreateIceCreamStores < ActiveRecord::Migration[6.0]
  def change
    create_table :ice_cream_stores do |t|
      t.integer :store_id
      t.integer :ice_cream_id

      t.timestamps
    end
  end
end
