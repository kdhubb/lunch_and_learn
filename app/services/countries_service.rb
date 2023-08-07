class CountriesService
  def conn
    Faraday.new(url: "https://restcountries.com/v3.1/") do |faraday|
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_list_of_countries
    get_url("all")
  end

  def validate_country(country)
    country.gsub!(" ", "%20")
    validation = get_url("name/#{country}")
    if validation.class == Hash
      validation[:status] == 200
    else
      validation.first[:name][:common].class == String
    end
  end
end