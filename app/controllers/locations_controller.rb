class LocationsController < ApplicationController

  def index
    @locations = if near_query.present?
                   Location.near(near_query)
                 else
                   Location.all
                 end
  end


  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      render action: 'show', notice: "Location Added"
    else
      render action: 'new'
    end
  end
  def update

  end

  def near_query
    PostalCode.new(search_value).coordinates
  end

  def search_value
    params[:search] && params[:search][:value]
  end


private
  def location_params
    params.require(:location).permit(:street, :city, :state, :postal, :court_name, :latitude, :longitude)
  end
end
