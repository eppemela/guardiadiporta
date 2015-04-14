class StaticController < ApplicationController

  def index
    @today_sessions = Session.today
  end

end
