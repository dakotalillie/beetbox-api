class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]
  skip_before_action :authorized, only: [:create, :exact_search]
  
  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
      # render json: {
      #   id: @user.id,
      #   username: @user.username, 
      #   first_name: @user.first_name,
      #   last_name: @user.last_name, 
      #   token: issue_token({id: @user.id})
      # }
    else
      render({json: {error: 'Error while creating user'}, status: 401})
    end
  end

  def exact_search
    matches = User.where(username: params[:query])
    if matches.first
      render json: { message: "taken" }
    else
      render json: { message: "available" }
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :first_name, :last_name, :password)
  end
end
