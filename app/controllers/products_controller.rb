class ProductsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @products = Product.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @product = Product.find(params[:id])
  end
end
