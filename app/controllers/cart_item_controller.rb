class CartItemController < ApplicationController
  skip_before_action :authorized, only: [:index] #you need  user authorization to view data or you can just uncomment this line

  def index
    cart_items = CartItem.all
    render json: cart_items
  end
end
