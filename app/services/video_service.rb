class VideoService
  def conn
    Faraday.new(url: "https://www.googleapis.com/youtube/v3/search") do |faraday|
      faraday.params['key'] = ENV['YOU-TUBE']
      faraday.params['part'] = "snippet"
      faraday.params['channelId'] = "UCluQ5yInbeAkkeCndNnUhpw"
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_videos_by_country(country)
    stuff = get_url("?q=#{country}")
  end
end