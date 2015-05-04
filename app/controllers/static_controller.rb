class StaticController < ApplicationController

  def index
    @present_stations = Station.today_visits
  end

  def today
    @today_sessions = Session.today
  end

end
