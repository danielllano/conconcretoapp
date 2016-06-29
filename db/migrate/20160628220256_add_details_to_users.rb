class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :points, :integer
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :mobile_phone, :string
  end
end
