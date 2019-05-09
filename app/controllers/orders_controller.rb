class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! #make sure user signed in before they place an order. Devise gives us this special keyword

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id]) 
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params) #create new order and pass in parameters from private section below
    @listing = Listing.find(params[:listing_id]) #can find the listing of the id that is being bought in the url
    @seller = @listing.user #the seller of the listing is the same as the user who created the listing
    
    #tells rails how to fill out columns
    @order.listing_id = @listing.id #tell rails how to fill in order listing id in datasbase with the listing id
    @order.buyer_id = current_user.id #Tells rails to fil out the buyer id column in the database with the current user id
    @order.seller_id = @seller.id #Tells rails to fill out seller id coluumn in the database

    respond_to do |format|
        if @order.save
        format.html { redirect_to root_url, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
        else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :state)
    end
end
