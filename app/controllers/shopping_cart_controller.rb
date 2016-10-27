class ShoppingCartController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_and_cart
  skip_before_action :verify_authenticity_token, only: [:update_cart]

  def show
    @relevant_products = Product.all.order("points DESC").limit(3)
  end

  def add_product_to_cart
    @product = Product.find(params[:product_id].to_i)
    @quantity = params[:quantity].to_i
    # if @product.available_qty >= @quantity
      if @shopping_cart.add(@product, @product.points, @quantity)
        flash[:notice] = 'Producto agregado al carrito satisfactoriamente'
        redirect_to shopping_cart_show_path
      else
        flash[:error] = 'No se pudo agregar el producto al carrito'
        redirect_to product_path(@product)
      end
    # else
    #   flash[:error] = 'El producto no esta disponible en la cantidad que deseas'
    #   redirect_to product_path(@product)
    # end
  end


  def update_cart
    params[:items_map].each do | cart_item_id, new_quantity |
      @shopping_cart_item = ShoppingCartItem.find(cart_item_id)
      @shopping_cart_item.update_quantity(new_quantity)
    end
    redirect_to shopping_cart_show_path
  end


  def purchase
    enough_points = true
    available_quantities = true

    if @user.points < @shopping_cart.subtotal.to_i
      enough_points = false
      flash[:error] = 'No tienes suficientes puntos para redimir el contenido actual del carrito'
      redirect_to shopping_cart_show_path
    end

    # @shopping_cart.shopping_cart_items.each do |item|
    #   product = Product.find(item.item_id)
    #   if product.available_qty < item.quantity
    #     available_quantities = false
    #     flash[:error] = "El producto '#{product.name}' ya no está disponible en la cantidad deseada. Quedan #{product.available_qty} unidades disponibles"
    #     redirect_to shopping_cart_show_path
    #   end
    # end

    if enough_points && available_quantities
      @user_purchases = []
      @shopping_cart.shopping_cart_items.each do |item|
        product = Product.find(item.item_id)
        # product.available_qty -= item.quantity
        product.save
        @new_purchase = Purchase.create(user_id: @user.id, product_id: product.id, quantity: item.quantity, status: "Pendiente");
        @user_purchases.push(@new_purchase) if @new_purchase
      end
      @user.points -= @shopping_cart.subtotal.to_i
      @user.save
      @shopping_cart.clear
      flash[:notice] = 'Productos redimidos'
      PurchaseConfirmationMailer.user_confirmation_email(@user, @user_purchases).deliver_later
      PurchaseConfirmationMailer.admin_confirmation_email(@user, @user_purchases).deliver_later
      redirect_to pages_confirmation_path
    end

  end


  def delete_item
    @product = Product.find(params[:product_id].to_i)
    @quantity = params[:quantity].to_i

    if @shopping_cart.remove(@product, @quantity)
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
      @shopping_cart = ShoppingCart.create(user_id: @user.id) unless @shopping_cart
    end

end
