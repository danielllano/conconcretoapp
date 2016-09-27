class ShoppingCartController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_and_cart

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
      else
        flash[:error] = 'No se pudo agregar el producto al carrito'
      end
    else
      flash[:error] = 'El producto no esta disponible en la cantidad que deseas'
    end
    redirect_to product_path(@product)
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
