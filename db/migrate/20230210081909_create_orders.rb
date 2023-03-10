class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :customer_id
      t.integer :total_payment
      t.integer :shipping_cost, default: 800
      t.integer :payment_method, default: 0
      t.integer :status, default: 0


      t.timestamps
    end
  end
end
