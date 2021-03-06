class CreateSamples < ActiveRecord::Migration[5.1]
  def change
    create_table :samples, id: :uuid do |t|
      t.string :name
      t.string :url
      t.string :preview_url
      t.string :instrument
      t.string :sample_type
      t.float :length
      t.float :tempo
      t.string :key
      t.string :genre

      t.integer :rating
      t.boolean :favorite

      t.references :user, type: :uuid, foreign_key: true
      t.references :library, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
