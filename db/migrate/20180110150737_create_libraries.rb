class CreateLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :libraries, id: :uuid do |t|
      t.string :name
      t.string :artwork_url
      t.references :user, type: :uuid, foreign_key: true
      t.timestamps
    end
  end
end
