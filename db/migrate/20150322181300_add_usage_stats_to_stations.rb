class AddUsageStatsToStations < ActiveRecord::Migration
  def change
    add_column :stations, :tx_bytes, 'BIGINT UNSIGNED'
    add_column :stations, :rx_bytes, 'BIGINT UNSIGNED'
  end
end
