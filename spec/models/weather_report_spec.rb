require 'rails_helper'

RSpec.describe WeatherReport, type: :model do

  it "is valid with valid attributes" do
    expect(WeatherReport.new(country_code: "US", city: "Andora")).to be_valid
  end
end
