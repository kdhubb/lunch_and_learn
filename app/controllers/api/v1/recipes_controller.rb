class Api::V1::RecipesController < ApplicationController
  def index
    require 'pry'; binding.pry
    render json: RecipeSerializer.new(RecipeFacade.new(params).recipe_search)
  end
end