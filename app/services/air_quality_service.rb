class AirQualityService 

  def conn
    Faraday.new(url: 'https://api.api-ninjas.com/v1/') do |faraday|
      faraday.headers['X-Api-Key'] = ENV['API-NINJAS']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_aqi_by_capital(city)
    get_url("airquality?city=#{city}")
  end
end