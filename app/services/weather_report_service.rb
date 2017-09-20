require 'net/http'

class WeatherReportService

  def initialize(weather_report)
    @weather_report = weather_report
  end

  def get_report
    #TODO search for a ruby gem in future who is mentioned on openweathermap.org and is properly managed
    make_request
  end

  private

  def query_params
    {
      q: @weather_report.city_and_country_code,
      appid: id
    }
  end

  def make_request
    begin
      uri                 = URI.parse(base_url)
      uri.query           = URI.encode_www_form(query_params)
      http                = Net::HTTP.new(uri.host, uri.port)
      request             = Net::HTTP::Get.new(uri.request_uri)
      response            = http.request(request)

      if response.code.to_i == 200
        JSON.parse response.read_body
      else
        handle_failure
      end

    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNREFUSED, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError, Errno::ETIMEDOUT => e
      handle_failure
    end
  end

  def handle_failure
    {
      error: 'Server is unable to fulfil your request. Please try with different country or city',
    }.as_json
  end

  def id
    #NOTE please make sure to set the value for openweathermap_app_id in config/application.yml
    ENV["openweathermap_app_id"]
  end

  #http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b1b15e88fa797225412429c1c50c122a1
  def base_url
    #NOTE please make sure to set the value for openweathermap_app_url in config/application.yml
    ENV["openweathermap_app_url"]
  end

end
