class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.string :key
      t.string :value
      t.string :unit

      t.timestamps null: false
    end
  end
end
