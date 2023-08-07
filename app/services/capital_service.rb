class CapitalService
  def conn
    Faraday.new(url: "https://restcountries.com/v3.1/name/")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_country_data(country)
    country = get_url("#{country}")
  end

  def get_capital_by_country(country)
    if country
      get_country_data(country).first[:capital].first
    end
  end
end