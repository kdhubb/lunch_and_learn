class Api::V1::AirQualityController < ApplicationController
  def index
    if !params[:country].present?
      render json: {error: "No parameters given"}, status: 418
    elsif params[:country] == ("" || " ")
      render json: AirQualitySerializer.new(AirQualityFacade.new(params).aqi_by_capital)
    elsif CountriesService.new.validate_country(params[:country]) == false 
      render json: {error: "Invalid country"}, status: :not_found
    else
      render json: AirQualitySerializer.new(AirQualityFacade.new(params).aqi_by_capital)
    end
  end
end