# Guardia di Porta

A simple rails app to monitor connected clients on a [dd-wrt](http://www.dd-wrt.com) based router

###Components
This monitoring app has two components:
- A simple **shell script** that get from the router the state of connected clients
- A **rake task** that update the clients status on the database


The **shell script** is:

```bash
#!/bin/bash
echo "Getting connected clients list on $(date)"
/usr/bin/ssh root@[router ip address] wl assoclist > /[path to rails app folder]/stations_dump
```

It is run by the system cron deamon every minute with this line placed in `/etc/crontab`

`*/1 * * * * pi bash /[path to rails app folder]/guardiadiporta.sh > /dev/null 2>&1`


the output of this script is something like this:

```
assoclist A0:EF:CE:59:2D:ED
assoclist 5C:8B:4E:3C:EB:FE
assoclist 4C:8D:70:F4:3F:4C
assoclist EC:3E:83:42:80:24
assoclist 78:B3:E4:E3:42:13
assoclist B0:C5:54:A0:D6:27
```
and it will be written on the `stations_dump` file in the rails app.


The **rake task** on the other hand gets runned every minute by [whenever](https://github.com/javan/whenever) gem, parses the *stations_dump* output file and updates the stations status in the
database.


##ToDo
Implement a vertical timeline with the stations in and outs using [this](http://tympanus.net/codrops/2011/12/05/lateral-on-scroll-sliding-with-jquery/).

##Styling
The theme I used is this free bootstrap theme here: (Dashgum)[http://www.blacktie.co/demo/dashgumfree/general.html]
