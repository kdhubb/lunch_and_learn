class VideoFacade

  def service
    VideoService.new
  end

  def video_by_country(country)
    if country == "" || !country
      {}
    else
      videos = service.get_videos_by_country(country)
      video = videos[:items].first
      Video.new(video[:snippet][:title], video[:id][:videoId])
    end
  end
end