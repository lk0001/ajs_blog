app = angular.module('posts-module', [])

app.directive('posts', ->
  {
    restrict: 'E',
    template: JST['angular/templates/posts/posts'],
    controllerAs: 'postsCtrl',
    controller: ->
      @posts = [
        {title: 'Some post', body: 'Body! body body body', author: 'Jim'},
        {title: 'Other post', body: 'Body! body body body', author: 'Jim'}
      ]
  }
)
