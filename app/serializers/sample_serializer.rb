class SampleSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :preview_url, :instrument, :length, :sample_type, :tempo, :key, :genre, :user_id, :library_id, :created_at
end
