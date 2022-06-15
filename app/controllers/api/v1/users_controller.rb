class Api::V1::UsersController < ApplicationController
  def create
    user_details = JSON.parse(params["_json"], symbolize_names: true)
    user = User.new(user_details)
    if user.save
      render json: UsersSerializer.new(user), status: :created
    else
      render json: {error: user.errors.full_messages.to_sentence}, status: 400
    end
  end
end
