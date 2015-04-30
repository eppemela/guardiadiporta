class StaticController < ApplicationController

  def index
    @present_stations = Station.present
  end

  def today
    @today_sessions = Session.today
  end

end
