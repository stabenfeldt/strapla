angular.module('app')
.directive('starred', function() {
  return {
    restrict: 'E',
    scope: {
      objectClass: '=',
      objectId: '='
    },
    templateUrl: '/templates/starred.html.slim',
    controller: ['$scope', '$attrs', function($scope, $attrs) {
      return $scope.star_clicked = function(e) {
        var id = $(e.target).closest('tr').data('customer-id');
        alert('clicked')
        //console.log("info: " + $attrs.objectClass);
        //console.log("info: " + $attrs.objectId);
      };
    }]
  };
});
