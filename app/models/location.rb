class Location < ActiveRecord::Base

  has_many :huddles


  STATES = [
  "Alabama","AL",
"Alaska","AK",
"Arizona","AZ",
"Arkansas","AR",
"California","CA",
"Colorado","CO",
"Connecticut","CT",
"Delaware","DE",
"District of Columbia","DC",
"Florida","FL",
"Georgia","GA",
"Hawaii","HI",
"Idaho","ID",
"Illinois","IL",
"Indiana","IN",
"Iowa","IA",
"Kansas","KS",
"Kentucky","KY",
"Louisiana","LA",
"Maine","ME",
"Montana","MT",
"Nebraska","NE",
"Nevada","NV",
"New Hampshire","NH",
"New Jersey","NJ",
"New Mexico","NM",
"New York","NY",
"North Carolina","NC",
"North Dakota","ND",
"Ohio","OH",
"Oklahoma","OK",
"Oregon","OR",
"Maryland","MD",
"Massachusetts","MA",
"Michigan","MI",
"Minnesota","MN",
"Mississippi","MS",
"Missouri","MO",
"Pennsylvania","PA",
"Rhode Island","RI",
"South Carolina","SC",
"South Dakota","SD",
"Tennessee","TN",
"Texas","TX",
"Utah","UT",
"Vermont","VT",
"Virginia","VA",
"Washington","WA",
"West Virginia","WV",
"Wisconsin","WI",
"Wyoming","WY"
]

  validates_presence_of :city
  validates_presence_of :street
  validates_presence_of :state
  validates_presence_of :postal
  validates_presence_of :court_name
  # validates_uniqueness_of :court_name
  validates_numericality_of :postal


  validates :state, inclusion: { in: STATES }

  geocoded_by :address
  after_validation :geocode

  def address
    [street, city, state, postal].compact.join(', ')
  end

  class<< self
    def huddles_at_location(location)
      location.huddles.order("time_and_date ASC")
    end

  end


end
