const WebSocket = require('ws');
const midi = require('midi');

const eventName = 'my_unique_event';
const input = new midi.input();
const output = new midi.output();

// console.log('Inputs:');
// for (var i = 0; i < input.getPortCount(); i++) {
// 	console.log('Input #'+i+': ' + input.getPortName(i));
// }
// console.log();

// console.log('Outputs:');
// for (var i = 0; i < output.getPortCount(); i++) {
// 	console.log('Output #'+i+': ' + output.getPortName(i));
// }
// console.log();

output.openPort(0);

const ws = new WebSocket(`ws://stagecast.se/api/events/${eventName}/ws?x-user-listener=1`);

const handleMessage = m => {
	if (!m.msg) {
		return;
	}

	// console.log('m',m);

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

	output.sendMessage([0xB0, 41, x]);
	output.sendMessage([0xB0, 42, y]);
	output.sendMessage([0xB0, 43, r]);
};

ws.on('open', () => {
	// setInterval(() => {
	// 	handleMessage({msg: {rawacc: [0,-90,-180]}})
	// 	setTimeout(() => {
	// 		handleMessage({msg: {rawacc: [180,0,0]}})
	// 		setTimeout(() => {
	// 			handleMessage({msg: {rawacc: [360,90,180]}})
	// 		},500);
	// 	},500);
	// },1500);
});

ws.on('message', data => {
	try {
		data = JSON.parse(data);
		handleMessage(data);
	} catch (e) {
		console.error(e);
	}
});

Number.prototype.map = function (in_min, in_max, out_min, out_max) {
	return (this - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
};

process.on('SIGINT', () => {
	output.closePort();
	process.exit(2);
});
