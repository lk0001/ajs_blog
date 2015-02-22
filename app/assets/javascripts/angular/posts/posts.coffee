app = angular.module('posts-module', [
  'ngResource'
])

app.factory('Post', ($resource) ->
  $resource('/api/posts/:id', null, {update: {method: 'PUT'}})
)

app.controller('PostsCtrl', ($scope, Post) ->
  $scope.posts = []
  Post.query((posts) ->
    $scope.posts = posts
  )
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

    controller: ($scope, Post) ->
      $scope.post = {}

      $scope.addPost = ->
        Post.save($scope.post, (data) ->
          $scope.posts.push(data)
          $scope.post = {}
          $scope.postForm.$setPristine()
        )
  }
)
