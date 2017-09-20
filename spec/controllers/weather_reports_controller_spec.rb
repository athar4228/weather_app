require 'rails_helper'

RSpec.describe WeatherReportsController, type: :controller do

  describe "GET /new" do
    it "render new partial with 200 status" do
      get :new
      expect(response.status).to eq(200)
      weather_report = assigns(:weather_report)
      expect(weather_report).instance_of? WeatherReport
      expect(response).to render_template :new
    end

    it "has a instance variable for WeatherReport" do
      get :new
      weather_report = assigns(:weather_report)
      expect(weather_report).instance_of? WeatherReport
    end
  end

  describe "POST /weather_reports" do
    it "render table of result" do
      allow_any_instance_of(WeatherReportService).to receive(:get_report).and_return(mocked_response)
      post :create, params: { weather_report: { country_code: "GB", city: "London" } }
      expect(response.status).to eq(200)
      api_response = assigns(:response)
      expect(api_response).instance_of? JSON
      expect(response).to render_template(:new)
    end

    it "render new partial with 200 status code if city is missing" do
      post :create, params: { weather_report: { country_code: "US" } }
      expect(response).to render_template(:new)
    end

    it "render new partial with 200 status code if country_code is missing" do
      post :create, params: { weather_report: { city: "Andora" } }
      expect(response).to render_template(:new)
    end
  end

  describe "GET /weather_reports" do
    it "routes to new action" do
      expect(:get => "/weather_reports").to route_to(controller: "weather_reports", action: 'new')
    end
  end

  def mocked_response
    {"coord":{"lon":-0.13,"lat":51.51},"weather":[{"id":300,"main":"Drizzle","description":"light intensity drizzle","icon":"09d"}],"base":"stations","main":{"temp":280.32,"pressure":1012,"humidity":81,"temp_min":279.15,"temp_max":281.15},"visibility":10000,"wind":{"speed":4.1,"deg":80},"clouds":{"all":90},"dt":1485789600,"sys":{"type":1,"id":5091,"message":0.0103,"country":"GB","sunrise":1485762037,"sunset":1485794875},"id":2643743,"name":"London","cod":200}
  end

end
