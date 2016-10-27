class ProductsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @products = Product.available.order("points ASC").paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @product = Product.find(params[:id])
  end

  # def new
  #   @product = Product.new
  # end

  # def create
  #   @product = Product.new(params.require(:product).permit(:name, :description, :points, :available_qty, :image1, :image2, :image3))
  #   if @product.save
  #     redirect_to products_url
  #   else
  #     render 'edit'
  #   end
  # end

  # def quick_view
  #   @product = Product.find(params[:id])
  # end
end
