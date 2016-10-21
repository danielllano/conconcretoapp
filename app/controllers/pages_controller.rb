class PagesController < ApplicationController

  def home
    @products = Product.all.order("created_at DESC").limit(4)
  end

  def confirmation
  end

  def construction
  end

  def faq
  end

  def terms_and_condictions
  end
end
