module ProductsHelper
  def is_new(product)
    days_old = (Time.now.utc - product.created_at)/(24 * 60 * 60)
    days_old < 15
  end

  def is_not_available(product)
    product.available_qty < 1
  end
end
