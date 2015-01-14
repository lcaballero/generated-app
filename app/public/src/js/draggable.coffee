DragDirective = ($document) ->

  normalisePoints = (event) ->
    event = if event.touches? then event.touches[0] else event

    event =
      x: event.pageX
      y: event.pageY


  link: ($scope, $element, $attrs) ->
    endTypes = 'touchend touchcancel mouseup mouseleave'
    moveTypes = 'touchmove mousemove'
    startTypes = 'touchstart mousedown'

    moveTypesArray = moveTypes.split ' '

    $document.bind endTypes, (event) ->
      event.preventDefault()

      for type in moveTypesArray
        $document.unbind type

    $element.bind startTypes, (event) ->
      event.preventDefault()

      startX = parseInt $element.css 'left'
      startY = parseInt $element.css 'top'
      interactionStart = normalisePoints event

      if isNaN startX
        startX = 0

      if isNaN startY
        startY = 0

      $document.bind moveTypes, (event) ->
        event.preventDefault()

        interactionCurrent = normalisePoints event

        $element.css
          left : startX + (interactionCurrent.x - interactionStart.x) + 'px'
          top  : startY + (interactionCurrent.y - interactionStart.y) + 'px'


DragDirective.$inject = ['$document']

angular.module("Draggable", []).directive 'draggable', DragDirective
