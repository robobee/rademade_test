class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :alias_name
      t.decimal :price

      t.timestamps null: false
    end
    add_index :products, :alias_name, :unique => true
  end
end
