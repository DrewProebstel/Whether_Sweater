class Api::V1::SessionsController < ApplicationController
  def create
    user_details = JSON.parse(params["_json"], symbolize_names: true)
    user = User.find_by(email: user_details[:email])
    if user&.authenticate(user_details[:password])
      render json: UsersSerializer.new(user)
    else
      render json: {error: "Unacceptable Login"}, status: 400
    end
  end
end
