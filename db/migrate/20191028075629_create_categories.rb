class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :neme,null:false,index: true
      t.integer :parent_id
      t.timestamps
    end
  end
end
