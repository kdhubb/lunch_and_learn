class AirQualityFacade 

  def initialize(query)
    @country = query[:country]
  end

  def service
    AirQualityService.new
  end

  def aqi_by_capital
    
  end
end