#REGex per i mac address:
#$re = "/([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F])/";

require 'ap'


str = "Station 70:14:a6:5e:4e:46 (on wlan0)
	inactive time:	20320 ms
	rx bytes:	12126917
	rx packets:	11771
	tx bytes:	4650087
	tx packets:	9222
	tx retries:	0
	tx failed:	0
	signal:  	-46 dBm
	signal avg:	-48 dBm
	tx bitrate:	54.0 MBit/s
	authorized:	yes
	authenticated:	yes
	preamble:	short
	WMM/WME:	no
	MFP:		no
	TDLS peer:		no
Station 28:cf:e9:61:e8:01 (on wlan0)
	inactive time:	6550 ms
	rx bytes:	12669904
	rx packets:	58556
	tx bytes:	29822756
	tx packets:	40628
	tx retries:	0
	tx failed:	0
	signal:  	-45 dBm
	signal avg:	-44 dBm
	tx bitrate:	54.0 MBit/s
	authorized:	yes
	authenticated:	yes
	preamble:	short
	WMM/WME:	no
	MFP:		no
	TDLS peer:		no"

res = str.split("\n").slice_before(/(Station )/).to_a

res.each do |stations|
  stations.each do |attrib|
    attrib.gsub!("\t",' ')
    attrib.lstrip!
  end

end

stations = Hash.new

res.each do |staz|
  stations[:mac_addr] = /([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F])/.match(staz[0])[0]
  stations[:rx_bytes] = /\d+/.match(staz[2])[0].to_i
  stations[:tx_bytes] = /\d+/.match(staz[4])[0].to_i
	stations[:last_seen] = Time.now.to_s
end

ap stations
