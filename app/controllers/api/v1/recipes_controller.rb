class Api::V1::RecipesController < ApplicationController
  def index
    render json: RecipeSerializer.new(RecipeFacade.new(params).recipes_by_country)
  end
end
