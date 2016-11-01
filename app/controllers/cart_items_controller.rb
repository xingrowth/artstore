class CartItemsController < ApplicationController

  def show
    @cart_items = Cart_item.all
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  def add_amount
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity < @cart_item.product.quantity
      @cart_item.quantity += 1
      @cart_item.save
      redirect_to carts_path
    else
      render :text => "库存不够啦"
    end
  end

  def subtract_amount
    @cart_item = CartItem.find(params[:id])
      if @cart_item.quantity < 2
        @cart_item.destroy
      else
        @cart_item.quantity -= 1
        @cart_item.save
      end
    redirect_to carts_path
  end

  # private
  #
  # def cart_params
  #   params.require(:cart_item)
  # end

end
