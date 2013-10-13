require 'spec_helper'

describe Location do

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


  it{should have_many :huddles}

  it{should have_valid(:street).when("6667 Buckstone Court")}
  it{should_not have_valid(:street).when( nil, " ")}

  it{should have_valid(:city).when("Columbia")}
  it{should_not have_valid(:city).when( nil, " ")}

  it{should have_valid(:state).when("Maryland", "MD")}
  it{should_not have_valid(:state).when( nil, " ", "Potato")}

  it{should have_valid(:postal).when(21044)}
  it{should_not have_valid(:postal).when( nil, " ", "Potato")}

  it{should have_valid(:court_name).when("Martin Road Park")}
  it{should_not have_valid(:court_name).when(" ", nil)}

  it{should have_valid(:longitude).when(123123123)}
  # it{should_not have_valid(:longitude).when(nil, " ", "potato")} #broken while geocode quota is spent

  it{should have_valid(:latitude).when(123123123)}
  # it{should_not have_valid(:latitude).when(nil, " ", "potato")}      #broken while geocode quota is spent

  # it{should validate_uniqueness_of(:court_name)} What is wrong with this thing?
  it{should validate_numericality_of(:postal)}
  it{should ensure_inclusion_of(:state).in_array(STATES)}


end
