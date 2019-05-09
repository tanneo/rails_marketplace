class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! #make sure user signed in before they place an order. Devise gives us this special keyword

  #deleted index so users cannot see all orders

  #on sales page, show all orders where seller of order equal to current user. Display as created at, descending.
  def sales
    @orders = Order.all.where(seller: current_user).order("created_at DESC") 
  end

  #on purchases page, show all orders where buyer of order equal to current user. Display as created at, descending.
  def purchases
    @orders = Order.all.where(buyer: current_user).order("created_at DESC")
  end

  #deleted show

  # GET /orders/new
  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id]) 
  end


 #deleted edit

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

    Stripe.api_key = ENV["STRIPE_API_KEY"] 

    @stripe_checkout_session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @listing.name,
        description: @listing.description,
        amount: (@listing.price * 100).floor,
        currency: 'aud',
        quantity: 1,
      }],
      success_url: 'https://localhost:3000/success',
      cancel_url: 'https://localhost:3000/cancel',
    )

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

 #deleted update and destroy

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