var express =		require('express'),
	fs =	 		require('fs'),
	path = 			require('path'),
	//workout_list = 	require(path.join(process.cwd(), '/data/workout.json'));
	workout_list = 	require('./data/workout');

var app = express.createServer();	
	
app.get('/', function (req, res) {
	res.end("uFit");
});

app.get('/preferences', function (req, res) {
	res.render('preferences.ejs', {title: 'Perferences'});
});

app.get('/select', function (req, res) {
	res.render('select.ejs', {title: 'Select'});
});

app.listen(3000);