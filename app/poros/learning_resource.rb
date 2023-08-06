class LearningResource
  attr_accessor :id,
                :country,
                :video,
                :images
  def initialize(data = {})
    @id = nil
    @country = country
    @video = {}
    @images = []
  end
end