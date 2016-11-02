class CartsController < ApplicationController
  before_action :authenticate_user!
  def index
    @carts = Cart.all
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to carts_path
    else
      render :new
    end
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to carts_path
    else
      render :edit
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    redirect_to carts_path
  end

  def checkout

    @order = Order.new
  end

  private

  def cart_params
    params.require(:cart).permit(:created_at, :updated_at)
  end
end
