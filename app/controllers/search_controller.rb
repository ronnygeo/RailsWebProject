class SearchController < ApplicationController
  def listings
    @listings = Listing.search params[:query], page: params[:page], per_page: 10
  end

  def events
    @events = Event.search params[:query], page: params[:page], per_page: 10
  end

  def places
    @places = Place.search params[:query], page: params[:page], per_page: 10
  end
end
