class Api::V1::LearningResourcesController < ApplicationController
  def index
    render json: LearningResourceSerializer.new(LearningResourceFacade.new(params).learning_resource_by_country)
  end
end