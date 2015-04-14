class Session < ActiveRecord::Base
  belongs_to :station

  scope :open, -> { where(open: true) }
  scope :closed, -> { where(open: false) }

  def self.get(station_id)
    where(station_id: station_id, open: true)
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
    today_sessions = []
    all_sessions = Session.all
    all_sessions.each do |sess|
      if(sess.start.today?)
        if( sess.station.name == nil)
          today_sessions.push(["anonymous", sess.start.to_s, sess.end.to_s])
        else
          today_sessions.push([sess.station.name.to_s, sess.start.to_s, sess.end.to_s])
        end
      end
    end
    today_sessions
  end

end
