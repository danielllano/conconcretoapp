class AddReferenceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :reference, :string
  end
end
