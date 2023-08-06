class Recipe
  attr_reader :title,
              :url,
              :image,
              :country,
              :id
              
  def initialize(data = {})
    @id = nil
    @title = data[:recipe][:label]
    @url = data[:recipe][:uri]
    @image = data[:recipe][:image]
    @country = country
  end

  def set_country(country)
    @country = country
  end
end