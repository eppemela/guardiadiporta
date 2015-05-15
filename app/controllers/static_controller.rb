class StaticController < ApplicationController

  def index
    @present_stations = Station.today_visits
    first_in_hash = {
      name:  Session.today.first.station.name,
      arrival_time:  Session.today.first.start
    }
    @first_in = first_in_hash

    last_out_hash = {
      name: Session.closed.today.last.station.name,
      leaving_time: Session.closed.today.last.end
    }
    @last_out = last_out_hash
    @total_visits = Session.today.group(:station_id)

  end

  def today
    @today_sessions = Session.today_timeline
  end

end
