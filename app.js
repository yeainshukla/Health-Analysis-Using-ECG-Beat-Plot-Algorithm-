'use strict';
var express = require("express"),
app = express(), path = require("path"), bodyParser = require("body-parser"),
methodOverride =
require("method- override");
var http = require('http').createServer(app); var port = process.env.PORT || 1337;
app.use(methodOverride("_method")); app.use(bodyParser.json()); app.use(bodyParser.urlencoded({ extended: true })); app.set("view engine", "ejs"); app.use(express.static( dirname + "/public"));
app.get('/', function (req, res) { res.render("home/ ECG_Home");
});
http.listen(port, process.env.IP, function ()
{ console.log("Server has been started!"); });