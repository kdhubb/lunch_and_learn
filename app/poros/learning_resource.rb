class LearningResource
  attr_accessor :id,
                :country,
                :video,
                :images
  def initialize(data = {}, video = {}, images = [])
    @id = nil
    @country = data[:country]
    @video = data[:video]
    @images = data[:images]
  end
end