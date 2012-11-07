class CartsController < ApplicationController

  def show
    @cart = Cart.find(current_cart)
  end

  def add_item
    @cart = current_cart
    product = Product.find(params[:id])
    unless @line_item = @cart.line_items.find_by_product_id(params[:id])
      @line_item = @cart.line_items.build
      @line_item.product_id = product.id
      @line_item.quantity = 1
    else
      @line_item.quantity += 1
    end
    if @line_item.save
      respond_to do |format|
        if @line_item.save
          format.html { redirect_to cart_path, notice: 'Item was
successfully added on a line item in the cart.' }
        else
          format.html { redirect_to cart_path, notice: 'An error occurred.
          Item was not added to cart.' }
        end
      end
    end
  end

  def remove_item
    @cart = Cart.find(current_cart)
    line_item_to_destroy = @cart.line_items.find(params[:id])
    line_item_to_destroy.destroy
    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Line item has been
removed' }
      end
  end

  def checkout

  end

  #GET /carts
  #GET /carts.json
  #def index
  #  @carts = Cart.all
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @carts }
  #  end
  #end
  #
  ## GET /carts/1
  ## GET /carts/1.json
  #def show
  #  @cart = Cart.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @cart }
  #  end
  #end
  #
  ## GET /carts/new
  ## GET /carts/new.json
  #def new
  #  @cart = Cart.new
  #
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @cart }
  #  end
  #end
  #
  ## GET /carts/1/edit
  #def edit
  #  @cart = Cart.find(params[:id])
  #end
  #
  ## POST /carts
  ## POST /carts.json
  #def create
  #  @cart = Cart.new(params[:cart])
  #
  #  respond_to do |format|
  #    if @cart.save
  #      format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
  #      format.json { render json: @cart, status: :created, location: @cart }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @cart.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## PUT /carts/1
  ## PUT /carts/1.json
  #def update
  #  @cart = Cart.find(params[:id])
  #
  #  respond_to do |format|
  #    if @cart.update_attributes(params[:cart])
  #      format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @cart.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## DELETE /carts/1
  ## DELETE /carts/1.json
  #def destroy
  #  @cart = Cart.find(params[:id])
  #  @cart.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to carts_url }
  #    format.json { head :no_content }
  #  end
  #end
end
