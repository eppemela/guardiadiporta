namespace :stations do
  desc "Update stations currently authenticated with the access point"
  task update: :environment do
    puts "Updating the station status"
    system("/sbin/iw dev wlan0 station dump > stations_dump")
    data = File.read("stations_dump")
    res = data.split("\n").slice_before(/(Station )/).to_a.each do |stations|
      stations.each do |attrib|
        attrib.gsub!("\t",' ')
        attrib.lstrip!
      end
    end.each do |staz|
      Station.find_or_create(/([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F])/.match(staz[0])[0] , /\d+/.match(staz[2])[0].to_i, /\d+/.match(staz[4])[0].to_i, Time.now.to_s )
    end

  end
end
