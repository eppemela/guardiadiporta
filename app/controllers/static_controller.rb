class StaticController < ApplicationController

  def index
    @today_sessions = Session.today
    @present_stations = Station.present
  end

end
