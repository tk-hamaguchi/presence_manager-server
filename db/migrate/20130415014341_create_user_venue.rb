class CreateUserVenue < ActiveRecord::Migration
  def self.up
    create_table :users_venues, :id => false do |t|
      t.references :user
      t.references :venue
    end
  end

  def self.down
    drop_table :users_venues
  end

end
