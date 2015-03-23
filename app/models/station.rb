class Station < ActiveRecord::Base

  def self.get(mac)
    find_by_mac_addr(mac)
  end

  def self.find_or_create(mac_address, rx_counter, tx_counter, last_time_seen)
    attributes = {
      mac_addr: mac_address,
      rx_bytes: rx_counter,
      tx_bytes: tx_counter,
      last_seen: last_time_seen
    }

    if (( existing_station = get(mac_address) ))
      existing_station.update_attributes(attributes)
    else
      create(attributes)
    end
  end


end
