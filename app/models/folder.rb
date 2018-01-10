class Folder < ApplicationRecord
  belongs_to :parent_folder, class_name: 'Folder', optional: true
  has_many :sub_folders, class_name: 'Folder', foreign_key: 'parent_folder_id'
  has_and_belongs_to_many :users
  has_and_belongs_to_many :samples
end
