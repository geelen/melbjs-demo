app = angular.module('melbjs-demo', [])

app.controller 'BodyController', ($scope, $http) ->
  $scope.chosenIndex = 0

  $scope.prev = -> $scope.chosenIndex--
  $scope.next = -> $scope.chosenIndex++

  $http.get('/slides.json').success (data) ->
    $scope.slides = data.slides
