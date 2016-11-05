class CartsController < ApplicationController
  before_filter :authenticate_user!

  def destroy
    @cart = current_cart
    @cart.destroy
    @cart_item = CartItem.where(:cart_id => @cart.id)
    @cart_item.each do |d|
      d.destroy
    end
    redirect_to :back
  end

  def checkout
    @order = Order.new
  end
end
