app = angular.module('melbjs-demo', [])

app.controller 'BodyController', ($http, $scope, Lolboats) ->
  $scope.currentSlide = 0
  $scope.prevSlide = -> $scope.currentSlide--
  $scope.nextSlide = -> $scope.currentSlide++

  $http.get('/slides.json').success (data) ->
    $scope.slides = data.slides

angular.module('melbjs-demo')
  .service 'Lolboats', ($http) ->
    lolool.lol
