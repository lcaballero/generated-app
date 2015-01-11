(function() {
  angular.module("Main", ["checkboxes"]).controller("MainCtrl", function() {
    return console.log('MainCtrl');
  });

  angular.module("checkboxes", []).directive("checkbox", function() {
    return {
      restrict: 'E',
      link: function(scope, element, attr) {
        var span, uuid;
        console.log('checkbox');
        console.log(element);
        span = angular.element("<span>");
        uuid = _.uuid();
        element.find("input").attr("id", uuid);
        return element.find("label").attr("for", uuid);
      }
    };
  });

}).call(this);
