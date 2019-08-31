const WebSocket = require('ws');
const channelName = 'my_unique_event';
const ws = new WebSocket(`wss://stagecast.se/api/events/${channelName}/ws`);
const authString = `{ "email" : "jonasjohansson@stagecast.se", "password" : "Ciao1234" }`;

const handleMessage = m => {
	if (!m.msg) {
		return;
	}

	// console.log('m', m);

	const rawx = m.msg.rawacc[0];
	const rawy = m.msg.rawacc[1];
	const rawr = m.msg.rawacc[2];

	let x = rawx.map(0, 360, 0, 127);
	let y = rawy.map(-90, 90, 0, 127);
	let r = rawr.map(-180, 180, 0, 127);

	x = Math.round(x);
	y = Math.round(y);
	r = Math.round(r);

	console.log(`_x: ${rawx}, _y: ${rawy}, _r: ${rawr}`);
	console.log(`x: ${x}, y: ${y}, r: ${r}`);

	// output.sendMessage([0xb0, 41, x]);
	// output.sendMessage([0xb0, 42, y]);
	// output.sendMessage([0xb0, 43, r]);
};

ws.on('open', () => {
	// if (auth !== '') ws.send(`${auth}`);
});

ws.on('message', data => {
	console.log(data.toString());
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

Number.prototype.map = function(in_min, in_max, out_min, out_max) {
	return ((this - in_min) * (out_max - out_min)) / (in_max - in_min) + out_min;
};

process.on('SIGINT', () => {
	process.exit(2);
});
