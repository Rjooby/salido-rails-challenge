class ProductsController < ApplicationController

  def index
    @products = Product.all

    respond_to do |format|
      format.html
      format.json {render json: @products}
    end

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
      redirect_to product_url(@product), status: 201
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
      redirect_to product_url(@product)
    else
      flash.now[:errors] = @product.errors.full_messages
      render :edit
    end

  end

  def destroy
    # @product = Product.find(params[:id])
    # @product.destroy
    # redirect_to products_url
  end

  private

  def product_params
    params.require(:product).permit(:vineyard, :region, :name, :url, :price_min, :price_max, :price_retail, :wine_type, :year)
  end
end
