module ApplicationHelper

  def render_countries(countries)
    countries.map{|country| [country.name, country.alpha2]}
  end
end
