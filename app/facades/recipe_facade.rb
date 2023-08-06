class RecipeFacade
  def initialize(data = {})
    @country = data[:country]
  end

  def service 
    RecipeService.new
  end

  def recipes_by_country
    recipes = service.get_recipes_by_country(@country)
    recipes[:hits].map do |recipe|
      new_recipe = Recipe.new(recipe)
      new_recipe.set_country(@country)
      new_recipe
    end
  end
end