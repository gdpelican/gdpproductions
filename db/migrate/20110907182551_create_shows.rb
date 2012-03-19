class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :blurb
      t.string :thumb_file_name
      t.string :thumb_content_type
      t.integer :thumb_file_size
      t.datetime :thumb_updated_at
      t.references :venue

      t.timestamps
    end
  end

  def self.down
    drop_table :shows
  end
end
