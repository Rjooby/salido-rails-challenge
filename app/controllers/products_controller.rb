class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
    else
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
    else
      flash.now[:errors] = @product.errors.full_messages
      render :edit
    end

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to locations_url
  end

  private

  def product_params
    params.require(:product).permit(:vineyard, :region, :name, :url, :price_min, :price_max, :price_retail, :type, :year)
  end
end
