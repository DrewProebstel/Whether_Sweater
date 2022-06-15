class Api::V1::SessionsController < ApplicationController
  def create
    # user = User.new(params.permit(:email, :password, :password_confirmation))
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      render json: UsersSerializer.new(user)
    else
      render json: {error: "Unacceptable Login"}, status: 400
    end
  end
end
