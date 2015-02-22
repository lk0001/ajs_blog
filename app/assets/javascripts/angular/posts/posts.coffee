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

app.controller('PostCtrl', ($scope, $stateParams, Post) ->
  $scope.post = {}
  Post.get(id: $stateParams.id, (post) ->
    $scope.post = post
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

app.directive('post', ->
  {
    restrict: 'E',
    template: JST['angular/templates/posts/post'],
    scope: {
      post: '='
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
