class Api::V1::AirQualityController < ApplicationController
  def index
    # render json: AirQualitySerializer.new(AirQualityFacade.new(params).aqi_lookup)
  end
end