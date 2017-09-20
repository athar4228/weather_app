class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def countries
    @countries = ISO3166::Country.all
  end

  helper_method :countries
end
