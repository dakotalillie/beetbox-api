class FolderSerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_folder_id, :sub_folders
end
