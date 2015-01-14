(function() {
  var DragDirective;

  DragDirective = function($document) {
    var normalisePoints;
    normalisePoints = function(event) {
      event = event.touches != null ? event.touches[0] : event;
      return event = {
        x: event.pageX,
        y: event.pageY
      };
    };
    return {
      link: function($scope, $element, $attrs) {
        var endTypes, moveTypes, moveTypesArray, startTypes;
        endTypes = 'touchend touchcancel mouseup mouseleave';
        moveTypes = 'touchmove mousemove';
        startTypes = 'touchstart mousedown';
        moveTypesArray = moveTypes.split(' ');
        $document.bind(endTypes, function(event) {
          var type, _i, _len, _results;
          event.preventDefault();
          _results = [];
          for (_i = 0, _len = moveTypesArray.length; _i < _len; _i++) {
            type = moveTypesArray[_i];
            _results.push($document.unbind(type));
          }
          return _results;
        });
        return $element.bind(startTypes, function(event) {
          var interactionStart, startX, startY;
          event.preventDefault();
          startX = parseInt($element.css('left'));
          startY = parseInt($element.css('top'));
          interactionStart = normalisePoints(event);
          if (isNaN(startX)) {
            startX = 0;
          }
          if (isNaN(startY)) {
            startY = 0;
          }
          return $document.bind(moveTypes, function(event) {
            var interactionCurrent;
            event.preventDefault();
            interactionCurrent = normalisePoints(event);
            return $element.css({
              left: startX + (interactionCurrent.x - interactionStart.x) + 'px',
              top: startY + (interactionCurrent.y - interactionStart.y) + 'px'
            });
          });
        });
      }
    };
  };

  DragDirective.$inject = ['$document'];

  angular.module("Draggable", []).directive('draggable', DragDirective);

}).call(this);
