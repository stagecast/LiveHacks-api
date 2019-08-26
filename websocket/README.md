# Stagecast web socket API
A web socket is available for you to use. Follow the instructions below for an example. 

## Receiving messages to a channel
Connect a web socket to the server endpoint at ws://stagecast.se/api/events/{channel_name}/ws (where {channel_name} is something unique or something shared with others)
Example using wscat (npm install -g wscat) to connect to the channel livehacks_test (pretending someone is sending the message above)

    $ wscat -c ws://stagecast.se/api/events/livehacks_test/ws 
    
    connected (press CTRL+C to quit)
    < {„from“:“78.72.157.99“,“msg“:“hello world!“}
    >

## Sending messages to a channel
### Authenticating

In order to send messages to specific users or to all users listening to the same channel (like _livehacks_test_ above), you would have to be authenticated. Authentication can be done, after you have connected the websocket (and before you send the first message) in one of two ways - either by supplying email address and password or by supplying a token that has been retrieved through logging in to the backend using https://stagecast.se/api/docs#section0.3. 

#### Example of authenticating using email and password

    $ wscat -c ws://stagecast.se/api/events/livehacks_test/ws 
    
    connected (press CTRL+C to quit)
    > {"email":"tempuser@stagecast.se","password":"the_secret"}
    < ok

#### Example of authenticating using token

    $ wscat -c ws://stagecast.se/api/events/livehacks_test/ws 
    
    connected (press CTRL+C to quit)
    > {"token":"JDJhJDEyJFZwSGZCSC9dcsaerUjVIdVNjRC5Dbjnjc0N1a0xiODRSu0d2aVdmQVV6nfr3MUgzM3ou"}
    < ok


### Broadcasting messages
Once you have authenticated anything you send on the channel will be broadcasted to all other listeners on the channel.  

    $ wscat -c ws://stagecast.se/api/events/livehacks_test/ws 
    
    connected (press CTRL+C to quit)
    ...authentication step removed...
    > „hello world!“
    >
    
### Direct messages
If you know the email address/user id of an authenticated recipient and wishes to only send to that recipient you can do
so by sending the message as following
```
{
	"to": "tester@testdomain.com",
	"message": "hello"
}
```
 
## See example
Go to -> *html-moment-example* and look at the example project provided. It uses a web socket connection to send gyro-data from the phone to a node server.
