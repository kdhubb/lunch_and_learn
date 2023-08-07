class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] == params[:password_confirmation]
      user = User.create!(user_params)
      user.update(api_key: Lockbox.generate_key)
      render json: UserSerializer.new(user), status: :created
    else
      render json: ErrorSerializer.new("Password and password confirmation must match").bad_request, status: :bad_request
    end
  end

  private 

  def user_params
    params.permit(:name, :email, :password_digest)
  end
end