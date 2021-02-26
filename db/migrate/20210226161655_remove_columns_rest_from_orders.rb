class RemoveColumnsRestFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :amount_cents, :integer, default: 0, null: false
    remove_column :orders, :name
  end
end
