# HTML moments
Here you'll find general information how to use a html moment (webview-moment) to try out your implementation inside the Stagecast app.

**See this [video]() how to launch the HTML Moment from the Stagecast webplatform.**


## Structure your html moment
To launch a html-moment from the Stagecast web platform your project has to be strucured into one single html file. The html, css and javascript code should be in **one single file**. See *boilerplate.html* above for example of the structure.




## HTML Moment public API
Whenever you launch an HTML moment the backend will inject an API that will allow you to retrieve useful information such as event ID, user ID, authentication token etc - information that is unique for this particular moment or event and can be used for accessing other APIs in the Stagecast platform. 

All functions are wrapped in a namespace called stagecast. 

### examples

```javascript
// Get the auth token of the client.
const token = stagecast.getToken()
// Get the event id
const eventId = stagecast.getEventId()
// Get the moment id
const momentId = stagecast.getMomentId()
// Get the moment class id
const momentClassId = stagecast.getMomentClassId()
// Get the moment state
const state = stagecast.isActive()
// Get the API endpoint host (staging.stagecast.se, stagecast.se)
const host = stagecast.getHost()
// Get the user id
const userId = stagecast.getUserId()
// Returns if the moment is active (returns the active boolean from the moment object (hard coded to true right now))
const userId = stagecast.isMomentActive()
// Returns the host name of our CDN
const cdn = stagecast.cdnHost()
```

## Stagecast API
If you have the _token_ as retrieved from the above API is is possible to invoke further methods in the Stagecast API which can be found at [http://stagecast.se/api/docs](https://stagecast.se/api/docs). 

In particularly useful for HTML view moments is perhaps the [Websocket API](http://stagecast.se/api/docs#section1.6) that can be used to, in real-time, send messages between clients in a moment or the various methods for persisting _moment state_ - like [Get global moment state](http://stagecast.se/api/docs#section2.5), [Get user moment state](http://stagecast.se/api/docs#section2.6), 
[Modify user moment state](http://stagecast.se/api/docs#section2.7) and 
[Subscribe to state changes](http://stagecast.se/api/docs#section2.8) 




## Access the Stagecast platform
How to access and use the platfrom, see the wiki: https://github.com/stagecast/api/wiki



