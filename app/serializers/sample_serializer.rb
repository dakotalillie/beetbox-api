class SampleSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :preview_url, :instrument, :length, :sample_type, :tempo, :key, :genre, :favorite, :rating, :user_id, :library_id, :folders, :tags, :created_at

  def folders
    object.folders.map {|folder| folder.id}
  end

  # def folders
  #   []
  # end

  def tags
    object.tags.map {|tag| tag.id}
  end

  # def tags
  #   []
  # end
end
