class AddAttachmentFullresFileToSamples < ActiveRecord::Migration[5.1]
  def self.up
    change_table :samples do |t|
      t.attachment :fullres_file
    end
  end

  def self.down
    remove_attachment :samples, :fullres_file
  end
end
