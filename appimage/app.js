const port = 80;
var express = require('express');
var exec = require('child_process').exec;

var app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.get('/', function(req, res, next)
{
    res.sendFile(__dirname + '/index.html');
});

app.post('/', function(req, res, next)
{
    let arch = req.body.arch;
    console.log('arch:', arch);
    exec("bin/getjupyter.sh " + arch, (error, stdout, stderr) =>
    {
        res.redirect(stdout);
	console.log(stderr);
	console.log(stdout);
    });
});

app.listen(port, function(){ console.log('listening on', port) });
