class Station < ActiveRecord::Base

  def self.get(mac)
    find_by_mac_addr(mac)
  end


  def self.find_or_create(mac_address, rx_counter, tx_counter, last_time_seen)
    attributes = {
      mac_addr: mac_address,
      rx_bytes: get_total_tx_or_rx_bytes(mac_address, "rx", rx_counter),
      tx_bytes: get_total_tx_or_rx_bytes(mac_address, "tx", tx_counter),
      last_seen: last_time_seen
    }

    if (( existing_station = get(mac_address) ))
      existing_station.update_attributes(attributes)
    else
      create(attributes)
    end
  end


  def self.get_total_tx_or_rx_bytes(mac, type, new_value)
    case type
    when "rx"
      old_value = get_last_rx_bytes(mac)
    when "tx"
      old_value = get_last_tx_bytes(mac)
    end

    if (new_value - old_value > 0)
      diff_value = old_value + (new_value - old_value)
    else
      diff_value = old_value + new_value
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
