class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.integer :item_id, unll: false
      t.integer :order_id, null: false
      t.integer :amount, unll: false
      t.integer :price, unll: false
      t.integer :making_status, unll: false
      t.timestamps
    end
  end
end
