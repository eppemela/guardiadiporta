namespace :stations do
  desc "Update stations currently authenticated with the access point"
  task update_stations: :environment do
    puts "Updating the station status"
    system("/sbin/iw dev wlan0 station dump > stations_dump")
    # data =
    # 'Station 70:14:a6:5e:4e:46 (on wlan0)
    # inactive time:	20320 ms
    # rx bytes:	12126917
    # rx packets:	11771
    # tx bytes:	4650087
    # tx packets:	9222
    # tx retries:	0
    # tx failed:	0
    # signal:  	-46 dBm
    # signal avg:	-48 dBm
    # tx bitrate:	54.0 MBit/s
    # authorized:	yes
    # authenticated:	yes
    # preamble:	short
    # WMM/WME:	no
    # MFP:		no
    # TDLS peer:		no
    # Station 28:cf:e9:61:e8:01 (on wlan0)
    # inactive time:	6550 ms
    # rx bytes:	12669904
    # rx packets:	58556
    # tx bytes:	29822756
    # tx packets:	40628
    # tx retries:	0
    # tx failed:	0
    # signal:  	-45 dBm
    # signal avg:	-44 dBm
    # tx bitrate:	54.0 MBit/s
    # authorized:	yes
    # authenticated:	yes
    # preamble:	short
    # WMM/WME:	no
    # MFP:		no
    # TDLS peer:		no
    # Station a0:ed:cd:59:2d:ed (on wlan0)
    # inactive time:	49300 ms
    # rx bytes:	6690589
    # rx packets:	9206
    # tx bytes:	1599160
    # tx packets:	4830
    # tx retries:	0
    # tx failed:	0
    # signal:  	-46 dBm
    # signal avg:	-48 dBm
    # tx bitrate:	54.0 MBit/s
    # authorized:	yes
    # authenticated:	yes
    # preamble:	short
    # WMM/WME:	no
    # MFP:		no
    # TDLS peer:		no
    # Station ec:35:86:42:80:24 (on wlan0)
    # inactive time:	0 ms
    # rx bytes:	41623945
    # rx packets:	172464
    # tx bytes:	162625130
    # tx packets:	177909
    # tx retries:	0
    # tx failed:	0
    # signal:  	-52 dBm
    # signal avg:	-52 dBm
    # tx bitrate:	54.0 MBit/s
    # authorized:	yes
    # authenticated:	yes
    # preamble:	short
    # WMM/WME:	no
    # MFP:		no
    # TDLS peer:		no
    # Station b0:c5:54:00:b6:27 (on wlan0)
    # inactive time:	5090 ms
    # rx bytes:	61292265
    # rx packets:	43925
    # tx bytes:	2160154
    # tx packets:	21723
    # tx retries:	0
    # tx failed:	0
    # signal:  	-43 dBm
    # signal avg:	-50 dBm
    # tx bitrate:	54.0 MBit/s
    # authorized:	yes
    # authenticated:	yes
    # preamble:	long
    # WMM/WME:	no
    # MFP:		no
    # TDLS peer:		no
    # '
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
