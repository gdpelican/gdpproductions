class AddPhotographerToShows < ActiveRecord::Migration
  def change
    add_column :shows, :photographer, :string
  end
end
