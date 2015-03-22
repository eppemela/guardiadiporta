class AddLastSeenToStations < ActiveRecord::Migration
  def change
    add_column :stations, :last_seen, :timestamp
  end
end
