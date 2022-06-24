class ProductsController < ApplicationController
  before_action :getProductId, only:[:show, :edit, :update,:destroy]
  def index
    @products=Product.all
  end

  def new
    @product=Product.new
  end

  def create
    @product=Product.create(product_params)
    @product.user_id=current_user.id
    if @product.save
      flash[:notice]="Product created Successfully"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def edit

  end

  def show

  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product is updated Successfully"
      redirect_to product_path
    else
      render 'edit'
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description,:price)
  end

  def getProductId
    @product=Product.friendly.find(params[:id])
  end
end
