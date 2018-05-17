from openframeworks import *
from protopixel import Content

# color is the current color displayed
color = ofColor(255, 255, 255)

content = Content("Remote Interface Script")
size = 255

content.FBO_SIZE = (size, size)

# Here we specify where the remote interface (HTML) is.
# In this case, we have the index.html file in a folder
# called "remote_interface"
content.web_path('remote_interface')


@content.websocket.receive
def websocket(ws, data):
    """
    This function handles user input through a websocket, as provided in /pl.js library.
    Use content.websocket.receive decorator to define handles like this.
    """
    global color
    r = data["R"]
    g = data["G"]
    b = data["B"]
    color = ofColor(r, g, b)


def draw():
    """
    We use r,g,b to set the color.
    """
    ofClear(color)


# You can also process the events of connection and disconnection for websockets:

@content.websocket.new
def websocket_new(ws):
    print "New websocket connection!"


@content.websocket.close
def websocket_close(ws):
    print "Websocket connection closed!"
