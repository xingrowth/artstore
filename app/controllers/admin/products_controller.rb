class Admin::ProductsController < ApplicationController

before_action :authenticate_user!
before_action :admin_required
  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @product = Product.find(params[:id])
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
      redirect_to admin_products_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, alert: "Product deleted"
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity,:image)
  end

end
