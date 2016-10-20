class AddApartmentNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apartment_number, :string
    add_index :users, :apartment_number, unique: true
  end
end
