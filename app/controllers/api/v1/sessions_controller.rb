class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      # render json: {
      #   id: user.id,
      #   username: user.username, 
      #   first_name: user.first_name,
      #   last_name: user.last_name,
      #   email: user.email,
      #   token: issue_token({id: user.id})
      # }
      render json: user
    else
      render({json: {error: 'User is invalid'}, status: 401})
    end
  end

  def show
    if current_user
      # render json: {
      #   id: current_user.id,
      #   username: current_user.username,
      #   first_name: current_user.first_name,
      #   last_name: current_user.last_name,
      # }
      render json: current_user
    else
      render json: {error: 'Invalid token'}, status: 401
    end
  end

end
