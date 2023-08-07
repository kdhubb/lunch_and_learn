class AirQualityFacade 

  def initialize(query)
    @country = query[:country]
  end

  def service
    AirQualityService.new
  end

  def get_capital
    CapitalService.new.get_capital_by_country(@country)
  end

  def aqi_by_capital
    randomize_country
    @country.gsub!(" ", "%20")
    capital = get_capital
    aqi = service.get_aqi_by_capital(capital)
    air_quality = AirQuality.new(aqi)
    air_quality.city = capital
    air_quality
  end

  def randomize_country
    if !@country || @country == ""
      @country = CountriesFacade.new.countries_list.sample.name
    end
  end
end