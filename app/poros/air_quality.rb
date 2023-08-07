class AirQuality
  attr_reader :id,
              :aqi,
              :pm25_concentration,
              :co_concentration

  attr_accessor :city

  def initialize(data)
    @id = nil
    @aqi = data[:overall_aqi]
    @pm25_concentration = data[:"PM2.5"][:concentration]
    @co_concentration = data[:CO][:concentration]
    @city = city
  end
end