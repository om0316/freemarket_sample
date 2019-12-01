class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name,null:false,index: true
      #t.integer :parent_id
      t.string :ancestry,index: true
      t.timestamps
    end
  end
end
