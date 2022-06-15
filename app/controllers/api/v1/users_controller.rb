class Api::V1::UsersController < ApplicationController
  def create
    # user_details = JSON.parse(params, symbolize_names: true)
    user = User.new(params.permit(:email, :password, :password_confirmation))
    if user.save
      render json: UsersSerializer.new(user), status: :created
    else
      render json: {error: user.errors.full_messages.to_sentence}, status: 400
    end
  end
end
