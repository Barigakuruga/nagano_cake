class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :amount
      t.integer :price
      t.integer :making_status, default: 

      t.timestamps
    end
  end
end
