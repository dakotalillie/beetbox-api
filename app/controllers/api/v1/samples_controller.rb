require 'zip'

class Api::V1::SamplesController < ApplicationController
  
  def create
    # FOR BASE64
    # if sample_params[:contents]
    #   file = Paperclip.io_adapters.for(sample_params[:contents])
    #   file.original_filename = sample_params[:name].gsub(/\s/, '_')
    #   @sample.fullres_file = file
    #   @sample.name = sample_params[:name]
    # end
    @samples = []

    params[:sample][:fullres_file].each do |key, sample_data|
      @sample = current_user.samples.new()
      wave = WaveInfo.new(sample_data.path)
      @sample.fullres_file = sample_data
      @sample.name = sample_data.original_filename
      @sample.url = "https://beetbox-data.s3.us-east-1.amazonaws.com/#{current_user.id}/original/#{@sample.name.gsub(/\s/, '_')}"
      @sample.length = wave.duration
      @sample.preview_url = "https://beetbox-data.s3.us-east-1.amazonaws.com/#{current_user.id}/mp3/#{@sample.name.gsub(/\s/, '_')}"
      if @sample.save
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
          SampleSerializer.new(@sample)
        ).serializable_hash
        UsersChannel.broadcast_to current_user, serialized_data
        # @samples.push(@sample)
      else
        render json: @sample.errors, status: :unprocessable_entity
      end
    end
    head :ok
    # render json: @samples, status: :created
  end
  
  def update
    byebug
  end
  
  def destroy
    params[:sampleIds].each do |id|
      sample = Sample.find(id)
      sample.delete
    end
    render json: params[:sampleIds]
  end

  def download
    if params[:samples].length == 1
      @sample = Sample.find(params[:samples][0][:id])
      data = open(@sample.fullres_file.s3_object(:original).presigned_url(:get))
      send_data data.read, :filename => @sample.name, :disposition => 'attachment', :type => data.content_type, :x_sendfile => true
    elsif params[:samples].length > 1
      temp_file = Tempfile.new('my_archive.zip')
      begin
        Zip::OutputStream.open(temp_file) { |zos| }
        Zip::File.open(temp_file.path, Zip::File::CREATE) do |zipfile|
          params[:samples].each do |file|
            @sample = Sample.find(file[:id])
            data = open(@sample.fullres_file.s3_object(:original).presigned_url(:get))
            zipfile.add(@sample.fullres_file_file_name, data)
          end
        end
        zip_data = File.read(temp_file.path)
        send_data(zip_data, type: 'application/zip', filename: 'my_archive.zip')
      ensure
        temp_file.close
        temp_file.unlink
      end
    end
  end
  
  private
  
  def set_sample
    @sample = Sample.find(params[:id])
  end
  
  def sample_params
    # params.require(:sample).permit(:fullres_file)
    params.require(:sample).permit(:name, :contents)
  end
end
