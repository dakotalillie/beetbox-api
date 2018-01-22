class Api::V1::LibrariesController < ApplicationController
  before_action :set_library, only: [:update, :destroy]

  def create
    @library = current_user.libraries.new()
    @library.name = library_params[:name]
    if library_params[:file]
      @library.image = library_params[:file]
      @library.artwork_url = "https://beetbox-data.s3.us-east-1.amazonaws.com/#{current_user.id}/images/thumb/#{@library.image_file_name.gsub(/\s/, '_')}"
    end
    if @library.save
      render json: @library, status: :created
    else
      render json: @library.errors, status: :unprocessable_entity
    end
  end

  def update
    if library_params[:name]
      @library.name = library_params[:name]
    end
    if library_params[:file]
      @library.image = library_params[:file]
      @library.artwork_url = (
        "https://beetbox-data.s3.us-east-1.amazonaws.com/#{current_user.id}/images/thumb/#{@library.image_file_name.gsub(/\s/, '_')}"
      )
    elsif library_params[:delete_file]
      @library.image.clear
      @library.artwork_url = nil
    end
    if @library.save
      render json: @library, status: :ok
    else
      render json: @library.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @library.destroy
      render json: { id: @library.id }, status: :ok
    else
      render json: @library.errors, status: :unprocessable_entity
    end
  end
  
  private

  def set_library
    @library = Library.find(params[:id])
  end
  
  def library_params
    params.require(:library).permit(:id, :name, :file, :delete_file)
  end
end
