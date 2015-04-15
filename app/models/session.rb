class Session < ActiveRecord::Base
  belongs_to :station

  scope :open, -> { where(open: true) }
  scope :closed, -> { where(open: false) }
  scope :opened_today, -> { where("start >= ?", Date.today).order(start: :asc) }

  def self.get(station_id)
    where(station_id: station_id, open: true)
  end

  def opened_today?
    start >= Date.today
  end

  def self.find_or_create(station_id, start_time)
    attributes_for_creation = {
      station_id: station_id,
      start: start_time,
      open: true
    }

    if (get(station_id).empty?)
      create(attributes_for_creation)
    end
  end

  def self.today
    all_sessions = []
    opened_today.each do |s|
      unless s.station.ignore?
        s.end.nil? ? end_time = Time.now : end_time = s.end
        s.station.name.nil? ? all_sessions.push([s.station.mac_addr, s.start, end_time]) : all_sessions.push([s.station.name.to_s, s.start, end_time])
      end
    end
    all_sessions
  end

end
