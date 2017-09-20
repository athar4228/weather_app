class WeatherReport

  include ActiveModel::Model

  attr_accessor :country_code, :city, :response

  validates :country_code, presence: true
  validates :city, presence: true

  def city_and_country_code
    [city, country_code].join(',')
  end
end
