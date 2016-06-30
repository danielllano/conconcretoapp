class CreatePointsHistories < ActiveRecord::Migration
  def change
    create_table :points_histories do |t|
      t.references :user, index: true, foreign_key: true
      t.string :description
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
