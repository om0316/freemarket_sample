class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, index: true, null: false
      t.integer :price, null: false
      t.text :detail, null: false
      t.integer :condition, null: false ,default: 0
      t.integer :shipping_burden,null: false 
      t.integer :shipping_way,null: false
      t.string :shipping_place,null: false
      t.integer :shipping_day,null: false
      t.integer :status,null: false ,default: 0
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
