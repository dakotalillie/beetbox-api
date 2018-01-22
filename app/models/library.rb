class Library < ApplicationRecord
  belongs_to :user
  has_many :samples

  has_attached_file :image,
                    :styles => { thumb: "100x100" },
                    :path => ':user_id/images/:style/:filename',
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :s3_region => 'us-east-1'

  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
  do_not_validate_attachment_file_type :image
  
  Paperclip.interpolates :user_id do |attachment, style|
    attachment.instance.user.present? ? attachment.instance.user.id : 'dev'
  end

  def s3_credentials
    {:bucket => "beetbox-data", :access_key_id => ENV['aws_access_key'], :secret_access_key => ENV['aws_secret_access_key']}
  end
end
