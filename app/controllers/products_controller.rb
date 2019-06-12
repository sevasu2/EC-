class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
      redirect_to @product, notice: "商品「#{@product.name}」を登録しました。"
    else
      flash[:error] = '作成に失敗'
      render :new
  end

  private

  def task_params
    params.require(:product).permit(:name, :description, :price, :unit)
  end

end
