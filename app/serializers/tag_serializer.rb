class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :count

  def count
    object.samples.count
  end
end
class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :count, :samples

  def samples
    object.samples.map {|sample| sample.id}
  end

  def count
    object.samples.count
  end
end