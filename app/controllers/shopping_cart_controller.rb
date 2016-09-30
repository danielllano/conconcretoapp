class ShoppingCartController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_and_cart
  skip_before_action :verify_authenticity_token, only: [:update_cart]

  def show
  end

  def add_product_to_cart
    @shopping_cart = ShoppingCart.create(user_id: @user.id) unless @shopping_cart
    @product = Product.find(params[:product_id].to_i)
    @quantity = params[:quantity].to_i
    if @product.available_qty >= @quantity
      if @shopping_cart.add(@product, @product.points, @quantity)
        @product.available_qty -= @quantity
        @product.save
        # @user.points -= @product.points
        # @user.save
        flash[:notice] = 'Producto agregado al carrito satisfactoriamente'
        redirect_to shopping_cart_show_path
      else
        flash[:error] = 'No se pudo agregar el producto al carrito'
        redirect_to product_path(@product)
      end
    else
      flash[:error] = 'El producto no esta disponible en la cantidad que deseas'
      redirect_to product_path(@product)
    end
  end


  def update_cart
    params[:items_map].each do | cart_item_id, new_quantity |
      @shopping_cart_item = ShoppingCartItem.find(cart_item_id)
      @shopping_cart_item.update_quantity(new_quantity)
    end
    redirect_to shopping_cart_show_path
  end


  def delete_item
    @product = Product.find(params[:product_id].to_i)
    @quantity = params[:quantity].to_i
    if @shopping_cart.remove(@product, @quantity)
      @product.available_qty += @quantity
      @product.save
      flash[:notice] = 'Item eliminado del carrito'
    else
      flash[:error] = 'No se pudo completar la acción deseada'
    end
    redirect_to shopping_cart_show_path
  end

  private

    def set_user_and_cart
      @user = User.find(current_user.id)
      @shopping_cart = ShoppingCart.find_by(user: @user)
    end
end
