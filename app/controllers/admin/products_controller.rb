class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
      flash[:notice] = "Update Success"
    else
      render :edit
    end
  end

  def require_admin
    if !current_user.is_admin
      redirect_to root_path
      flash[:alert] = "You are not admin"
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity)
  end
end
