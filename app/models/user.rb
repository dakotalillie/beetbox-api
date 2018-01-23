class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :folders
  has_many :libraries
  has_many :samples
  has_many :tags
end
