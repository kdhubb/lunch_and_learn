class ImageFacade 
  def initialize(params)
    @country = params[:country]
  end

  def service 
    ImageService.new
  end

  def images_by_country 
    images = service.get_images_by_country(@country)
    images[:results].map do |image|
      Image.new(image[:urls][:regular], image[:alt_description])
    end
  end
end