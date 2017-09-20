require 'rails_helper'

RSpec.describe WeatherReport, type: :model do

  it "is valid with valid attributes" do
    expect(WeatherReport.new(country_code: "US", city: "Andora")).to be_valid
  end

  it "is invalid if country_code is empty" do
    expect(WeatherReport.new(city: "Andora")).not_to be_valid
  end

  it "is invalid if city is empty" do
    expect(WeatherReport.new(country_code: "US")).not_to be_valid
  end
end
