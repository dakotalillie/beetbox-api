class CreateFolderSampleJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :folders_samples, id: false do |t|
      t.uuid :folder_id
      t.uuid :sample_id
    end
  end
end
