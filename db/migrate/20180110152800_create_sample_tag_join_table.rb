class CreateSampleTagJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :samples_tags, id: false do |t|
      t.uuid :sample_id
      t.uuid :tag_id
    end
  end
end
