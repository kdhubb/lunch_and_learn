class LearningResource
  attr_accessor :id,
                :country,
                :video,
                :images
  def initialize(data = {})
    @id = nil
    @country = data[:country]
    @video = data[:video]
    @images = data[:images]
  end
end