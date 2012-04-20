class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :alt
      t.string :caption
      t.integer :show_id
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
      t.boolean :cover_photo_ind
      t.references :show

      t.timestamps
    end
    
    add_index :pictures, :show_id
    
  end

  def self.down
    drop_table :pictures
  end
end
