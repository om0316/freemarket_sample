class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :customer_id
      t.references :user, null:false,foreign_key: true, type: :integer
      t.timestamps
    end
  end
end