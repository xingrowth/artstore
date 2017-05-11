class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save(product_params)
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if product.update(product_params)
      redirect_to products_path, notice: "Update Successful"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      redirect_to products_path, alert: "Product Deleted"
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    redirect_to :back, notice: "测试加入购物车"
  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end




end
