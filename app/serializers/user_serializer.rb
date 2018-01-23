class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :email, :token
  has_many :samples
  has_many :folders
  has_many :libraries
  has_many :tags

  # grab a unique list of tags from the user's samples, along with a count for each tag
  # def tags
  #   object.tags.reduce([]) do |memo, tag|

  #   # object.samples.reduce([]) do |memo, sample|
  #   #   sample.tags.each do |tag|
  #   #     if !memo.detect {|i| i[:id] == tag.id}
  #   #       memo.push({
  #   #         id: tag.id,
  #   #         name: tag.name,
  #   #         count: 1
  #   #       })
  #   #     else
  #   #       memo.detect {|i| i[:id] == tag.id}[:count] += 1
  #   #     end
  #   #   end
  #   #   memo
  #   # end
  # end

  def token
    issue_token({id: object.id})
  end

  private

  def issue_token(payload)
    JWT.encode(payload, ENV['secret'], 'HS256')
    # your code should be in another file that is .gitignore'd, use a gem like 'figaro' to manage
  end
end
