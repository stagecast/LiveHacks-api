# HTML moment example

Turn smartphone accelerometer data into whatever via Node.js

## Login

1. http://stagecast.se/login and login with your _stagecast_ credentials.

## Create event

1. http://stagecast.se/dashboard/event/list
2. Publish the event by clicking 'Publish' next to the event.

## Create HTML moment

1. Enter the newly created event and click the '+' sign.
2. Under 'Stage Moments' choose 'Html'.
3. Open 'html-send.html', change the variable 'channelName' and save.
4. Copy/paste the contents from 'html-send.html'
5. Save and Exit.

You can also visit https://device-moment.glitch.me/ on your mobile device to see if it works.

## Run Node

1. Do 'npm install'
2. Open up 'html-receive.js', change the variable 'channelName' and save.
3. run 'node html-receive.js'

---

# Legacy

## Debug MIDI

Install https://www.snoize.com/MIDIMonitor/ to monitor the MIDI data.

## Documentation & Links

1. https://github.com/justinlatimer/node-midi
2. https://github.com/websockets/ws
3. https://www.tobias-erichsen.de/software/virtualmidi.html
4. http://projectgus.github.io/hairless-midiserial/
5. https://resolume.com/download/

---

Based on the work of Possan, https://github.com/possan/stagecast-hack2018
