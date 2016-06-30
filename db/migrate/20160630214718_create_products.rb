class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :points
      t.integer :available_qty

      t.timestamps null: false
    end
  end
end
