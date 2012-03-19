class AddTicketLinkToShows < ActiveRecord::Migration
  def self.up
    add_column :shows, :ticket_link, :string
  end

  def self.down
    remove_column :shows, :ticket_link
  end
end
