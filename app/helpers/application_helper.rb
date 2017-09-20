module ApplicationHelper

  def render_countries(countries)
    countries.map{|country| [country.name, country.alpha2]}
  end

  def alert_class(alert_type)
    {
      success: 'success',
      error: 'danger',
      alert: 'warning',
      notice: 'success',
    } [alert_type.to_sym]
  end
end
