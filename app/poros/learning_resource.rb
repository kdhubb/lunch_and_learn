class LearningResource
  attr_accessor :id,
                :country,
                :video,
                :images

  def initialize(data = {}, _video = {}, _images = [])
    @id = nil
    @country = data[:country]
    @video = data[:video]
    @images = data[:images]
  end
end
