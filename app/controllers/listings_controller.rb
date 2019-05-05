class ListingsController < ApplicationController
    def index
        @listings = Listing.all
    end

    def new

    end
end
