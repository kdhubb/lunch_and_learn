class VideoFacade
  def initialize(params = {})
    @country = params[:country]
  end

  def service
    VideoService.new
  end

  def video_by_country
    videos = service.get_videos_by_country(@country)
    video = videos[:items].first
    Video.new(video[:snippet][:title], video[:id][:videoId])
  end
end