class RecipeService
  def conn
    Faraday.new(url: 'https://api.edamam.com/api/recipes/v2') do |faraday|
      faraday.params['app_id'] = ENV['EDAMAM-ID']
      faraday.params['app_key'] = ENV['EDAMAM-KEY']
      faraday.params['type'] = 'public'
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_recipes_by_country(country)
    stuff = get_url("?q=#{country}")
  end
end
