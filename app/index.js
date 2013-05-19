// Generated by CoffeeScript 1.6.2
(function() {
  var app, assets, config, express, mongoose, routes, store, stylus;

  express = require('express');

  stylus = require('stylus');

  assets = require('connect-assets');

  mongoose = require('mongoose');

  app = express();

  app.port = process.env.PORT || process.env.VMC_APP_PORT || 3000;

  config = require("./config");

  app.configure('production', 'development', 'testing', function() {
    return config.setEnvironment(app.settings.env);
  });

  if (app.settings.env !== 'production') {
    mongoose.connect('mongodb://localhost/restful');
  } else {
    console.log('If you are running in production, you may want to modify the mongoose connect path');
  }

  app.use(assets());

  app.use(express["static"](process.cwd() + '/public'));

  store = new express.session.MemoryStore;

  app.use(express.cookieParser());

  app.use(express.session({
    secret: 'shhh',
    store: store
  }));

  app.set('view engine', 'jade');

  app.use(express.bodyParser());

  routes = require('./routes');

  routes(app);

  module.exports = app;

}).call(this);