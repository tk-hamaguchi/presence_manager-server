class CreateSeminars < ActiveRecord::Migration
  def change
    create_table :seminars do |t|
      t.integer :venue_id
      t.integer :user_id

      t.string :name
      t.datetime :started_at
      t.datetime :ended_at
      t.datetime :opened_at
      t.datetime :closed_at
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
