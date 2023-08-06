class Video 
  attr_reader :title,
              :video_id
  def initialize(data)
    @title = data[:title]
    @video_id = data[:video_id]
  end
end