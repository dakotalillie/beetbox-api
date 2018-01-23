class Api::V1::TagsController < ApplicationController
  before_action :set_tag, only: [:update, :destroy]

  def create
    @tag = current_user.tags.new(tag_params)
    if @tag.save
      render json: @tag, status: :created
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def update
    @tag.name = tag_params[:name] if tag_params[:name]
    if @tag.save
      render json: @tag, status: :ok
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @tag.destroy
      render json: { id: @tag.id }, status: :ok
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end
  
  private

  def set_tag
    @tag = Tag.find(params[:id])
  end
  
  def tag_params
    params.require(:tag).permit(:id, :name)
  end
end
