class CreateAttends < ActiveRecord::Migration
  def change
    create_table :attends do |t|
      t.integer :user_id
      t.integer :seminar_id

      t.timestamps
    end
  end
end
