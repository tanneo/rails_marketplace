class ListingsController < ApplicationController
    before_action :set_listing, only: [:image, :show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:seller, :new, :create, :edit, :update, :destroy] #before a user takes these actions, need to authenticate them first by making sure that they are signed in
    before_action :check_user, only: [:edit, :update, :destroy] #no check_user keyword in devise so need to make own function in private at bottom of screen
  
     # When a user wants to go to new seller URL, the listings that they want to see are the same listings as the signed in user and orders them to when they were created in descending order
    def seller
      @listings = Listing.where(user: current_user).order("created_at DESC")
    end

    # GET /listings
    # GET /listings.json
    # Display all Listings
    def index
      @listings = Listing.all.order("created_at DESC")
    end
  
    # GET /listings/1
    # GET /listings/1.json
    def show
    end
  
    # GET /listings/new
    def new
      @listing = Listing.new
    end
  
    # GET /listings/1/edit
    def edit
    end
  
    # POST /listings
    # POST /listings.json
    def create
      @listing = Listing.new(listing_params)
      @listing.user_id = current_user.id #Devise uses helpful keyword current_user which is getting current user and setting it to the id of the current listing
      
  
      respond_to do |format|
        if @listing.save
          format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
          format.json { render :show, status: :created, location: @listing }
        else
          format.html { render :new }
          format.json { render json: @listing.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /listings/1
    # PATCH/PUT /listings/1.json
    def update
      respond_to do |format|
        if @listing.update(listing_params)
          format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
          format.json { render :show, status: :ok, location: @listing }
        else
          format.html { render :edit }
          format.json { render json: @listing.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /listings/1
    # DELETE /listings/1.json
    def destroy
      @listing.destroy
      respond_to do |format|
        format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_listing
        @listing = Listing.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def listing_params
        params.require(:listing).permit(:name, :description, :price, :image)
      end

      #checks to see if the current user that is logged in, is the same as the user that created the listing in question
      def check_user
        if current_user != @listing.user
          redirect_to root_url, alert: "Sorry, this listing belongs to someone else" 
        end
      end
  end