class PagesController < ApplicationController

  def home
    @products = Product.all.order("created_at DESC").limit(4)
  end

  def confirmation
  end

  def construction
  end
end
