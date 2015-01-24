app = angular.module('posts-module', [])

app.controller('PostsController', ($scope) ->
  $scope.posts = [
    {title: 'Some post', body: 'Body! body body body', author: 'Jim'},
    {title: 'Other post', body: 'Body! body body body', author: 'Jim'}
  ]
)

app.directive('posts', ->
  {
    restrict: 'E',
    template: JST['angular/templates/posts/list'],
    scope: {
      posts: '='
    }
  }
)

app.directive('postForm', ->
  {
    restrict: 'E',
    template: JST['angular/templates/posts/form'],
    scope: {
      posts: '='
    }

    controller: ($scope) ->
      $scope.addPost = (post) ->
        $scope.posts.push(post)
  }
)
