var express =		require('express'),
	fs =	 		require('fs'),
	path = 			require('path'),
	workout_list = 	require('./data/workout');

var app = express.createServer();	
app.use(express.static(path.join(__dirname, 'public')));

app.get('/', function (req, res) {
	res.render('preferences.ejs', {title: 'Perferences'});
});

app.get('/select', function (req, res) {
	res.render('select.ejs', {title: 'Select'});
});

var port = process.env.PORT || 5000;
app.listen(port, function() {
  console.log("Listening on " + port);
  });
