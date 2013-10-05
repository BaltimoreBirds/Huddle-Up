class Location < ActiveRecord::Base

  acts_as_gmappable :lattitude => 'lattitude', :longitude => 'longitude', :process_geocoding => :false,
                   city: 'city', state: 'state', country: 'country',
                  :msg => "Sorry, not even Google could figure out where that is"

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    " #{self.city}, #{self.state}, #{self.country}"
  end
end
