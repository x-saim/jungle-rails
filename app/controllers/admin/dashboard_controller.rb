class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name:ENV['AUTH_ADMIN_USERNAME'], password: ENV['AUTH_ADMIN_PASSWORD']
  
  def show
    @category_count = Category.count
    @product_count = Product.count
  end
end
