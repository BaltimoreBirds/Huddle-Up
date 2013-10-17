class LocationsController < ApplicationController
  # class_attribute :request_geocoding_gatherer

  # self.request_geocoding_gatherer = RequestGeocodingGatherer

  def index
    # @current_location_by_ip = geocoded_request_information.current_location

    @locations = if search_value.present?
                   Location.near(search_value)
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

private

  def search_value
    params[:search] && params[:search][:value]
  end

  def geocoded_request_information
    request_geocoding_gatherer.new(request)
  end


  def location_params
    params.require(:location).permit(:street, :city, :state, :postal, :court_name, :latitude, :longitude)
  end
end
