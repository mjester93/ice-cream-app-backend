class AddIsStoreOwnerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_store_owner, :boolean
  end
end
