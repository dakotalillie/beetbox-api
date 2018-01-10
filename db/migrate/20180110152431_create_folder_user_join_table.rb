class CreateFolderUserJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :folders_users, id: false do |t|
      t.uuid :folder_id
      t.uuid :user_id
    end
  end
end
