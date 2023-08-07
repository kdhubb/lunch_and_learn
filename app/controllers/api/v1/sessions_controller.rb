class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: UserSerializer.new(user), status: :created
    else
      render json: ErrorSerializer.new("Bad credentials given").forbidden, status: :forbidden
    end
  end
end