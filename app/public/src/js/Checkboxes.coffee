angular.module("Main", ["checkboxes"])
.controller "MainCtrl", ->
  console.log 'MainCtrl'

angular.module("checkboxes", []).directive("checkbox", ->


  restrict: 'E'
  link: (scope, element, attr) ->
    console.log('checkbox')

    console.log(element)

    span = angular.element("<span>")


    uuid = _.uuid()
    element.find("input").attr("id", uuid)
    element.find("label").attr("for", uuid)
)