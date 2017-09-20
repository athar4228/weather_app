class WeatherReport

  include ActiveModel::Model

  attr_accessor :country_code, :city

  validates :country_code, presence: true
  validates :city, presence: true
end
