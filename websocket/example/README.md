# Websocket example 1
This is an example project to demonstrate how to connect and send messages using a websocket from/to the HTML Moment (mobile) from/to a website.

## Setup 
1. Open `ws_web-client.html` and set your own `<room_name>`, `<username>` and `<password>`.

- <room_name> this can be anything.
- `<username>` and `<password>` these are the credentials you have used to sign up on the Stagecast platform.

2. Run `ws_web-client.html` in a browser on your computer.

3. Copy the code in `ws_mobile-client.html` and paste it into a HTML Moment on the Stagecast platform. Then Launch the Moment.

4. Try to send a message.

_If you are new to Stagecast plaform - watch this [video](https://drive.google.com/file/d/1oCo_ezmw7FWeuh2rlgdItQCSagjFSGk2/view) about how the Stagecast webplatform works._

## Documentation 

Both `ws_web-client.html` and `ws_mobile-client.html` have very similar functionality.

Both are:
1. Open a web socket connection and authenticate.
2. Enable the user to post a message that is broadcasted in the websocket room.

`ws_mobile-client.html` is using the `stagecast` [API](https://github.com/stagecast/LiveHacks-api/tree/master/html-moments) to get token, userId and momentId.
