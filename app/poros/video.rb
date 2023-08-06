class Video 
  attr_reader :title,
              :youtube_video_id
  def initialize(data)
    @title = data[:title]
    @youtube_video_id = data[:videoId]
  end
end