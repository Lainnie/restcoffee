// Generated by CoffeeScript 1.6.2
(function() {
  exports.index = function(req, res) {
    var data;

    data = {
      "hello": ["world"]
    };
    return res.send(data);
  };

  exports.pong = function(req, res) {
    var data;

    data = {
      pongQuery: req.query,
      pongBody: req.body,
      pongParams: req.params,
      pongCookies: req.cookies,
      id: req.params.id,
      controller: req.params.controller,
      method: req.params.method
    };
    return res.send(data);
  };

}).call(this);