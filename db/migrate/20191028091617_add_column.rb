class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :category, foreign_key: true,null:false
    add_reference :items, :brand, foreign_key: true,null:false
  end
end
