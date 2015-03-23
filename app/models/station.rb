class Station < ActiveRecord::Base

  def self.get(mac)
    find_by_mac_addr(mac)
  end

  def self.find_or_create(mac_address, rx_counter, tx_counter, last_time_seen)

    #TODO: refactor in a proper single function
    
    old_rx_value = get_last_rx_bytes(mac_address)
    if ( (rx_counter - old_rx_value) > 0 )
      diff_rx_value = old_rx_value + (rx_counter - old_rx_value)
    else
      diff_rx_value = old_rx_value + rx_counter
    end

    old_rx_value = get_last_rx_bytes(mac_address)
    if ( (tx_counter - old_rx_value) > 0 )
      diff_tx_value = old_rx_value + (tx_counter - old_rx_value)
    else
      diff_tx_value = old_rx_value + tx_counter
    end


    attributes = {
      mac_addr: mac_address,
      rx_bytes: diff_rx_value,
      tx_bytes: diff_tx_value,
      last_seen: last_time_seen
    }

    if (( existing_station = get(mac_address) ))
      existing_station.update_attributes(attributes)
    else
      create(attributes)
    end
  end

  def self.get_last_rx_bytes(mac)
    s = get(mac)
    s.rx_bytes
  end

  def self.get_last_tx_bytes(mac)
    s = get(mac)
    s.tx_bytes
  end

end
