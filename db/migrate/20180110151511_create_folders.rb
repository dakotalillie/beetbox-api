class CreateFolders < ActiveRecord::Migration[5.1]
  def change
    create_table :folders, id: :uuid do |t|
      t.string :name
      t.references :parent_folder, type: :uuid, index: true # foreign_key: true

      t.timestamps
    end
  end
end
