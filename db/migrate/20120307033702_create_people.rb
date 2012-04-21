class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name
      t.string :salt
      t.string :pass_hash
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end