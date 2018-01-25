class FolderSerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_folder_id, :sub_folders, :samples

  def samples
    object.samples.map {|sample| sample.id}
  end
end
