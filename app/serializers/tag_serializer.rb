class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :count

  def count
    object.samples.count
  end
end
