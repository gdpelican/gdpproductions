class AddPhotographerToPhotos < ActiveRecord::Migration
  def change
    add_column :pictures, :photographer, :string
  end
end
