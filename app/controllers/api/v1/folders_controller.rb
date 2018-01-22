class Api::V1::FoldersController < ApplicationController
  before_action :set_folder, only: [:update, :destroy]

  def create
    @folder = Folder.new()
    @folder.name = folder_params[:name]
    @folder.parent_folder_id = folder_params[:parent] if folder_params[:parent]
    if @folder.save
      current_user.folders << @folder
      render json: @folder, status: :created
    else
      render json: @folder.errors, status: :unprocessable_entity
    end
  end

  def update
    @folder.name = folder_params[:name] if folder_params[:name]
    @folder.parent_folder_id = folder_params[:parent] if folder_params[:parent]
    if @folder.save
      render json: @folder, status: :ok
    else
      render json: @folder.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @folder.destroy
      render json: { id: @folder.id }, status: :ok
    else
      render json: @folder.errors, status: :unprocessable_entity
    end
  end
  
  private

  def set_folder
    @folder = Folder.find(params[:id])
  end
  
  def folder_params
    params.require(:folder).permit(:id, :name, :parent)
  end
end
