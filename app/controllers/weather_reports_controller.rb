class WeatherReportsController < ApplicationController

  before_action :validate_parameters,  only: [:create]

  def new
    @weather_report = WeatherReport.new
  end

  def create
    service = WeatherReportService.new(@weather_report)
    @response = service.get_report
    if @response["error"]
      flash[:error] = @response["error"]
      redirect_to new_weather_report_path
    else
      render 'new'
    end
  end

  private

  def weather_report_params
    params.fetch(:weather_report).permit(:country_code, :city)
  end

  def validate_parameters
    @weather_report = WeatherReport.new(weather_report_params)
    unless @weather_report.valid?
      render 'new'
    end
  end

end
