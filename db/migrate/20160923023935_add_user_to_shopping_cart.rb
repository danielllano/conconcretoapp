class AddUserToShoppingCart < ActiveRecord::Migration
  def change
    add_reference :shopping_carts, :user, index: true, foreign_key: true
  end
end
