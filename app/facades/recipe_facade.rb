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
      recipes = service.get_recipes_by_country(@country)
      recipe_objects = recipes[:hits].map do |recipe|
        new_recipe = Recipe.new(recipe)
        new_recipe.set_country(@country)
        new_recipe
      end
      until recipes != [] do 
        recipes = service.get_recipes_by_country(@country)
        recipe_objects_next_random = recipes[:hits].map do |recipe|
          new_recipe = Recipe.new(recipe)
          new_recipe.set_country(@country)
          new_recipe
        end
      end
      recipe_objects || recipe_objects_next_random
    else
      recipes = service.get_recipes_by_country(@country)
      recipe_objects = recipes[:hits].map do |recipe|
        new_recipe = Recipe.new(recipe)
        new_recipe.set_country(@country)
        new_recipe
      end
      recipe_objects
    end
  end

  def randomize_country
      @country = CountriesFacade.new.countries_list.sample.name
  end
end