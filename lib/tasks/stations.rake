namespace :stations do
  desc "Update stations currently authenticated with the access point"
  task update: :environment do
    puts "Updating stations status on database"
    File.open("stations_dump", "r").each_line do |line|
      line.gsub!("assoclist ",'')
      line.strip!
      Station.find_or_create(line,Time.now.to_s)
      unless Station.get(line).ignore?
        Session.find_or_create(Station.get(line).id, Time.now.to_s)
      end
    end
  end
end
