angular.module("Nodes", ['Draggable']).controller "NodesController", ($scope) ->

  i = 0
  id = 0

  nodes = (
    for x in [0..5]
      for y in [0..5]
        {
          id : (++id)
          name : 'node-' + (++i)
          content : 'content-' + (++i)
          x : x * 110
          y : y * 110
          hasTitle : (id % 5 == 0)
        }
  )

  $scope.nodes = _.flatten(nodes)

