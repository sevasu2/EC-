class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params) #入力した値が失敗した時も残るようにするため
    if @product.save
      redirect_to products_path, notice: "商品「#{@product.name}」を登録しました。"
    else
      flash[:error] = '作成に失敗'
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :price,
      :unit,
      :image
      )
  end

end
