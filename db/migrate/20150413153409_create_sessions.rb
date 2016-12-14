class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.datetime :start
      t.datetime :end
      t.integer :duration
      t.boolean :open
      t.integer :station_id

      t.timestamps null: false
    end
  end
end
