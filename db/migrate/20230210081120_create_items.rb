class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction
      t.string :price
      

      t.timestamps
    end
    add_column :items, :is_active, :boolean, default: true
  end
end
