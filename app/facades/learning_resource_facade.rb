class LearningResourceFacade
  def initialize(params)
    @country = params[:country]
  end

  def learning_resource_by_country
    video = VideoFacade.new.video_by_country(@country)
    images = ImageFacade.new.images_by_country(@country)
    resource = LearningResource.new({
                                      country: @country,
                                      video:,
                                      images:
                                    })
  end
end
