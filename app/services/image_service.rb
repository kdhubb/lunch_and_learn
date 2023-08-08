class ImageService
  def conn
    Faraday.new(url: 'https://api.unsplash.com/search/photos') do |faraday|
      faraday.params['client_id'] = ENV['UNSPLASH-ACCESS']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_images_by_country(country)
    stuff = get_url("?query=#{country}")
  end
end
