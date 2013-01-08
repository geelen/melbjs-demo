app = angular.module('melbjs-demo', [])

app.controller 'BodyController', ($scope) ->
  $scope.simpleMaths = ->
    1 + 2
