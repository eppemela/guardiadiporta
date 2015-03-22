class AddMacAddressToStations < ActiveRecord::Migration
  def change
    add_column :stations, :mac_addr, :string
  end
end
