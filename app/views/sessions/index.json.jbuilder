json.array!(@sessions) do |session|
  json.extract! session, :id, :start, :end, :duration, :open, :station_id
  json.url session_url(session, format: :json)
end
