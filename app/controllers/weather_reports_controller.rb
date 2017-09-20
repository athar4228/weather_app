class WeatherReportsController < ApplicationController

  def new
    @weather_report = WeatherReport.new
  end

  def create
    @weather_report = WeatherReport.new(weather_report_params)
    if @weather_report.valid?
      redirect_to new_weather_report_path
    else
      render 'new'
    end
  end

  private

  def weather_report_params
    params.fetch(:weather_report).permit(:country_code, :city)
  end

end
