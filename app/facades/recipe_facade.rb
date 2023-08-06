class RecipeFacade
  def initialize(data = {})
    @country = data[:country]
    @random = data[:choose_country_for_me]
  end

  def service 
    RecipeService.new
  end

  def recipes_by_country
    if @random == "true"
      randomize_country
    end
    recipes = service.get_recipes_by_country(@country)
    recipes[:hits].map do |recipe|
      new_recipe = Recipe.new(recipe)
      new_recipe.set_country(@country)
      new_recipe
    end
  end

  def randomize_country
      @country = CountriesFacade.new.countries_list.sample.name
  end
end