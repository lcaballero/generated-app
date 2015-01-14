(function() {
  angular.module("Nodes", ['Draggable']).controller("NodesController", function($scope) {
    var i, id, nodes, x, y;
    i = 0;
    id = 0;
    nodes = (function() {
      var _i, _results;
      _results = [];
      for (x = _i = 0; _i <= 5; x = ++_i) {
        _results.push((function() {
          var _j, _results1;
          _results1 = [];
          for (y = _j = 0; _j <= 5; y = ++_j) {
            _results1.push({
              id: ++id,
              name: 'node-' + (++i),
              content: 'content-' + (++i),
              x: x * 110,
              y: y * 110,
              hasTitle: id % 5 === 0
            });
          }
          return _results1;
        })());
      }
      return _results;
    })();
    return $scope.nodes = _.flatten(nodes);
  });

}).call(this);
