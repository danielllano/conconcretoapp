class ShoppingCartController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
  end

  def add_product_to_cart
    @shopping_cart = ShoppingCart.find_by(user: @user)
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

  private

    def set_user
      @user = User.find(current_user.id)
    end
end
