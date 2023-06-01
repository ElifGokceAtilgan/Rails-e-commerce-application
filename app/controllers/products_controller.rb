class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @search = Product.all.ransack params[:q]
    @products = @search.result(distinct: true).paginate(page: params[:page], per_page: 15)
    respond_to do |format|
      format.html
    end
  end 

  def set_product
    @product = Product.find(params[:id])
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url,
                                notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product,
                                  notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }

        @products = Product.all.order(:name)
        ActionCable.server.broadcast 'products',
                                     html: render_to_string('store/index', layout: false)
      else
        format.html { render :edit }
        format.json { render json: @product.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product,
                                  notice: 'Product was successfully created.' }
        format.json { render :show, status: :created,
                             location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors,
                             status: :unprocessable_entity }
      end
    end
  end
  
  def add_to_cart
    product = Product.find(params[:id])
    redirect_to root_path, notice: 'Product added to cart successfully.'
  end

  private
  def product_params
    params.require(:products).permit(:name, :price, :description, :image_url, :stock)
  end
end
