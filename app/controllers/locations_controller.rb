class LocationsController < ApplicationController


  def index
    @locations = Location.all
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
private
  def location_params
    params.require(:location).permit(:address, :court_name, :latitude, :longitude)
  end
end
