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
    it "redirects with 302 status code" do
      post :create, params: { weather_report: { country_code: "US", city: "Andora" } }
      expect(response.status).to eq(302)
      expect(response).to redirect_to(new_weather_report_path)
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

end
