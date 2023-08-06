class CountriesFacade 
  def service
    CountriesService.new
  end

  def countries_list 
    Rails.cache.fetch("countries_list", expires_in: 30.days) do
      service.get_list_of_countries.map do |country|
        Country.new(country)
      end
    end
  end
end