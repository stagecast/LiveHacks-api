# Stagecast web socket API
A web socket is available for you to use. Follow the instructions below for an example. 

## Sending messages to a channel
Connect a web socket to the server endpoint at ws://stagecast.se/api/events/{channel_name}/ws
(where {channel_name} is something unique or something shared with others)

Example using wscat (npm install -g wscat) to connect to the channel livehacks_test:

    $ wscat -c ws://stagecast.se/api/events/livehacks_test/ws 
    
    connected (press CTRL+C to quit)
    > „hello world!“
    >

## Receiving messages to a channel
Connect a web socket to the server endpoint at ws://stagecast.se/api/events/{channel_name}/ws?x-user-listener=1 (where {channel_name} is something unique or something shared with others)
Example using wscat (npm install -g wscat) to connect to the channel livehacks_test (pretending someone is sending the message above)

    $ wscat -c ws://stagecast.se/api/events/livehacks_test/ws?x-user-listener=1 
    
    connected (press CTRL+C to quit)
    < {„from“:“78.72.157.99“,“msg“:“hello world!“}
    >

## See example
Go to -> *html-moment-example* and look at the example project provided. It uses a web socket connection to send gyro-data from the phone to a node server.
