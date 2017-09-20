require 'rails_helper'

RSpec.describe WeatherReportService, type: :service do

  let(:weather_report) { WeatherReport.new(country_code: "GB", city: "London") }

  it "returns valid response if city and country code are present" do
    report_service =  WeatherReportService.new(weather_report)
    response = report_service.get_report
    expect(response["cod"]).to eq(200)
    expect(response.has_key?("weather")).to be(true)
  end

  it "returns error if city and country are blank" do
    weather_report.city = nil
    weather_report.country_code = nil
    report_service =  WeatherReportService.new(weather_report)
    response = report_service.get_report
    expect(response.has_key?("error")).to be(true)
  end
end
