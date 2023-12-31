class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    favorite = user&.favorites&.find_by(recipe_link: params[:recipe_link])
    if user && !favorite
      user.favorites.create!(favorites_params)
      render json: { success: 'Favorite added successfully' }, status: :created
    elsif user && favorite
      render json: { error: 'Favorite already saved' }, status: :unprocessable_entity
    else
      render json: ErrorSerializer.new('Invalid API key').not_found, status: :not_found
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: FavoriteSerializer.new(user.favorites), status: :ok
    else
      render json: ErrorSerializer.new('Invalid API key').not_found, status: :not_found
    end
  end

  private

  def favorites_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end
