class RecipeFacade
  def initialize(data = {})
    @country = data[:country]
    @random = data[:choose_country_for_me]
  end

  def service 
    RecipeService.new
  end

  def recipes_by_country
    recipes = service.get_recipes_by_country(@country)
    require 'pry'; binding.pry
    recipes[:hits].map do |recipe|
      new_recipe = Recipe.new(recipe)
      new_recipe.set_country(@country)
      new_recipe
    end
  end

  def recipe_search
    if @random == "true" 
      @country = CountriesFacade.new.countries_list.sample.name
    end
    stuff = recipes_by_country
    require 'pry'; binding.pry
  end
end