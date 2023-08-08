class Image
  attr_reader :url,
              :alt_tag

  def initialize(url, alt_tag)
    @url = url
    @alt_tag = alt_tag
  end
end
