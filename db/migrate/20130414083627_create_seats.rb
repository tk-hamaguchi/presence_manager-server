class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :name
      t.integer :venue_id
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
