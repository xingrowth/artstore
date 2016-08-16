class Account::OrdersController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :show, :destroy]

  def index
    @orders = current_user.orders
  end

  def destroy
    @order = current_user.orders.find(params[:id])
    @order.destroy
    flash[:alert] = 'Delete order success!'
    redirect_to :back
  end

  # def cancel
  #   @order = current_user.orders.find(params[:id])
  #   #binding.pry
  #   @order.cancel_order
  #   #binding.pry
  #   @order.save
  #   flash[:alert] = 'You already cancel the order'
  #   redirect_to :back
  # end

end
