# HTML moment

## Login

1. http://staging.stagecast.se/login and login with your _staging_ credentials.

## Create event

1. http://staging.stagecast.se/dashboard/event/list
2. Publish the event by clicking 'Publish' next to the event.

## Create HTML moment

1. Enter the newly created event and click the '+' sign.
2. Under 'Stage Moments' choose 'Html'.
3. Open up 'html-send.html', change the variable 'eventName' and save.
4. Where it says 'YOUR HTML' copy/paste the contents from 'html-send.html'
5. Save and Exit.

## Run Node

1. Do 'npm install'
2. Open up 'html-receive.js', change the variable 'eventName' and save.
3. run 'node html-receive.js'