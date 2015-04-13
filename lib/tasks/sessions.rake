namespace :sessions do
  desc "Close sessions for offline stations"
  task close: :environment do
    puts "Finding recently disconnected stations"
    stations = Station.not_present
    stations.each do |staz|
      staz.sessions.each do |sess|
        if (sess.open?)
          puts "Closing the sessions and updating the duration"
          sess.end = Time.now
          sess.duration = (sess.end - sess.start)
          sess.open = false
          sess.save
        end
      end
    end
  end
end
