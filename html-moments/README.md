# HTML moments
Here you'll find general information how to use a html moment.

***

## Structure your html moment
To launch a html-moment from Stagecast web platform your project has to be strucured into one single html file. The html, css and javascript code should be in one single file. See *boilerplate.html* for example of the structure.

***

## Launch a moment from the Stagecast platform

### Login

1. http://stagecast.se/login and login with your _stagecast_ credentials.

### Create event

1. http://stagecast.se/dashboard/event/list
2. Publish the event by clicking 'Publish' next to the event.

### Create HTML moment

1. Enter the newly created event and click the '+' sign.
2. Under 'Stage Moments' choose 'Html'.
3. Where it says 'YOUR HTML' copy/paste the contents from 'html-send.html'
4. Save and Exit.
5. Launch the moment.

### See moment in phone

1. Find the event you have created.
2. Open the timeline and view your moment.

***

## HTML-moment-example
In the *html-momment-example* folder you'll find an example project that you can build upon. The project takes input from the gyroscope in the phone and sends that information to a node-server through a websocket connection. The server outputs a midi signal that could be used to changes lights etc.
