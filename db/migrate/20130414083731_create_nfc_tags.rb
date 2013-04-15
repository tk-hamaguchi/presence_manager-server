class CreateNfcTags < ActiveRecord::Migration
  def change
    create_table :nfc_tags do |t|
      t.string :name
      t.string :code
      t.string :sequence
      t.integer :seat_id

      t.timestamps
    end
  end
end
