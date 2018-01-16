class FolderSerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_folder_id
end
