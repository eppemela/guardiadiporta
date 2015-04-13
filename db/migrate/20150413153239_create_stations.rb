class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.string :mac_addr
      t.datetime :last_seen
      t.boolean :ignore

      t.timestamps null: false
    end
  end
end
