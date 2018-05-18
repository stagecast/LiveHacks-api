# HTML moment example 
Turn smartphone input data into visual output in ProtoPixel Create via Python and OFX.

## Login

1. http://stagecast.se/login and login with your _stagecast_ credentials.

## Create event

1. http://stagecast.se/dashboard/event/list
2. Publish the event by clicking 'Publish' next to the event.

## Create HTML moment

1. Enter the newly created event and click the '+' sign.
2. Under 'Stage Moments' choose 'Html'.
3. Open 'html-send.html', change the variable 'eventName' and save.
4. Where it says 'YOUR HTML' copy/paste the contents from 'html-send.html'
5. Save and Exit.

## Run PPX

1. Open ProtoPixel Create and click 'Workspace' > 'New Content' > 'Script'
2. Choose 'remote_interface.py'
3. Click 'Project' > 'Open Webapp'
4. Select 'remote_interface.py'

***

## Debug PPX

The PPX server runs at port 8181, for instance: http://localhost:8181/libs/pl.js

## Documentation

1. https://protopixel.net/doc/create/quick_start.html
2. https://openframeworks.cc/documentation/