class Video
  attr_reader :title,
              :youtube_video_id

  def initialize(title, youtube_video_id)
    @title = title
    @youtube_video_id = youtube_video_id
  end
end
