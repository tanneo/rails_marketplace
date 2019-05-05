class ListingsController < ApplicationController
    before_action :set_listing, only: [:image, :show, :edit, :update, :destroy]

    def index
      @listings = Listing.all
    end
  
    def show
    end

    def edit
    end
  
    def create
    #   @listing = Listing.new(listing_params)
    end
  
#     private
#       def set_listing
#         @listing = Listing.find(params[:id])
#       end
  
 
#       def listing_params
#         params.require(:listing).permit(:name, :description, :price,)
#       end
  end