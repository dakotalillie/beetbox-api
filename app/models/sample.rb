class Sample < ApplicationRecord
  belongs_to :user
  belongs_to :library
  has_and_belongs_to_many :folders
  has_and_belongs_to_many :tags
end
