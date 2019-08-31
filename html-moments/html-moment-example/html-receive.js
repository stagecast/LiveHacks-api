const WebSocket = require('ws');
const channelName = 'my_unique_event';
const ws = new WebSocket(`wss://stagecast.se/api/events/${channelName}/ws`);
const authString = `{ "email" : "jonasjohansson@stagecast.se", "password" : "Ciao1234" }`;

const handleMessage = m => {
	console.log('m', m);
};

ws.on('open', () => {
	if (authString !== '') ws.send(`${authString}`);
});

ws.on('message', data => {
	if (data.toString() === 'ok') {
		return;
	}
	try {
		data = JSON.parse(data);
		handleMessage(data);
	} catch (e) {
		console.error(e);
	}
});

process.on('SIGINT', () => {
	process.exit(2);
});
