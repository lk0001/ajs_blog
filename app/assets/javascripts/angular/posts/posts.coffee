app = angular.module('posts-module', [
  'ngResource'
])

app.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

app.factory('Post', ($resource) ->
  $resource('/api/posts/:id', null, {update: {method: 'PUT'}})
)

app.controller('PostsController', ($scope, Post) ->
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

    controller: ($scope) ->
      $scope.post = {}

      $scope.addPost = ->
        $scope.posts.push($scope.post)
        $scope.post = {}
        $scope.postForm.$setPristine()
  }
)
