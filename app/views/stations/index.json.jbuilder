json.array!(@stations) do |station|
  json.extract! station, :id, :name, :mac_addr, :last_seen, :ignore
  json.url station_url(station, format: :json)
end
