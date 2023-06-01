class CartsController < ApplicationController


  def index
    @cart = Cart.find_by(user_id: current_user.id)
    @products = @cart.products
    @total_price = calculate_total_price(@products)
  end
  
  def add_to_cart
    product = Product.find(params[:product_id])
    if product.stock > 0
      @cart = Cart.find_or_create_by(user_id: current_user.id)
      # product.update(cart: @cart)
      @cart.products << product
      product.decrement!(:stock)
      redirect_to root_path, notice: t("views.cart.added")
    else
      redirect_to root_path, notice: t("views.cart.no_stock")
    end

  end 

  def show
  
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end
    
    
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to store_index_url,
                                notice: 'Your cart is currently empty' }
      format.json { head :no_content }
    end
  end

  def remove_from_cart
    product = Product.find(params[:product_id])
    if product.stock > 0
      @cart = Cart.find_by(user_id: current_user.id)
      @cart.products.delete(product)
      product.increment!(:stock)
      redirect_to carts_path, notice: t("views.cart.deleted")
    else
      redirect_to root_path, notice: t("views.cart.no_stock")
    end
  end

  def increase_quantity
    product = Product.find(params[:product_id])
    if product.stock > 0
      @cart = Cart.find_by(user_id: current_user.id)
      cart_product = @cart.cart_products.find_by(product_id: product.id)
      cart_product.increment!(:quantity)
      product.decrement!(:stock)
      redirect_to carts_path, notice: t("views.cart.quantity_increased")
    else
      redirect_to root_path, notice: t("views.cart.no_stock")
    end
  end
  
  def decrease_quantity
    product = Product.find(params[:product_id])
    @cart = Cart.find_by(user_id: current_user.id)
    cart_product = @cart.cart_products.find_by(product_id: product.id)
    if cart_product.quantity && cart_product.quantity > 1
      cart_product.decrement!(:quantity)
      product.increment!(:stock)
      redirect_to carts_path, notice: t("views.cart.quantity_decreased")
    else
      cart_product.destroy
      product.increment!(:stock)
      redirect_to carts_path, notice: t("views.cart.removed")
    end
  end
    

  def cart_params
    params.fetch(:cart, {})
  end

  private
  def calculate_total_price(products)
    total_price = 0
    products.each do |product|
      cart_product = CartProduct.find_by(cart: @cart, product: product)
      if cart_product && product.price && cart_product.quantity
        total_price += product.price * cart_product.quantity
      end
    end
    total_price
  end

end
