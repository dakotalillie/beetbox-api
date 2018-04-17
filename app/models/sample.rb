class Sample < ApplicationRecord
  belongs_to :user
  belongs_to :library, optional: true
  has_and_belongs_to_many :folders
  has_and_belongs_to_many :tags

  has_attached_file :fullres_file,
                    styles: { mp3: {} },
                    processors: [:ffmpeg_wav_to_mp3],
                    :path => ':user_id/:style/:filename',
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :s3_region => 'us-east-1'
  validates_attachment_file_name :fullres_file, :matches => [/wav\Z/, /Wav\Z/,/mpe?g\Z/]
  do_not_validate_attachment_file_type :fullres_file

  Paperclip.interpolates :user_id do |attachment, style|
    attachment.instance.user.present? ? attachment.instance.user.id : 'dev'
  end
  
  def s3_credentials
    {:bucket => "beetbox-data", :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end
end
