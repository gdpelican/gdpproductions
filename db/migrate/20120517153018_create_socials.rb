class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.string :name
      t.string :link
      t.string :alt
      t.string :icon_file_name
      t.string :icon_content_type
      t.integer :icon_file_size
      t.datetime :icon_updated_at      
      t.timestamps
    end
  end
end
