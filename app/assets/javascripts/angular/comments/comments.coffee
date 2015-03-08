app = angular.module('comments-module', [
  'ngResource'
])

# # # FACTORIES # # #

app.factory('Comment', ($resource) ->
  $resource('/api/comments/:id', null, {update: {method: 'PUT'}})
)

# # # DIRECTIVES # # #

app.directive('commentsLayout', ->
  {
    restrict: 'E',
    template: JST['angular/templates/comments/layout'],
    scope: {
      postId: '='
    },
    controller: ($scope, Comment) ->
      $scope.comments = []
      Comment.query(post_id: $scope.postId, (comments) ->
        $scope.comments = comments
      )
  }
)

app.directive('comments', ->
  {
    restrict: 'E',
    template: JST['angular/templates/comments/list'],
    scope: {
      comments: '='
    }
  }
)

app.directive('comment', ->
  {
    restrict: 'E',
    template: JST['angular/templates/comments/comment'],
    scope: {
      comment: '='
    }
  }
)

app.directive('commentForm', ->
  {
    restrict: 'E',
    template: JST['angular/templates/comments/form'],
    scope: {
      comments: '=',
      postId: '='
    }

    controller: ($scope, Comment) ->
      $scope.comment = {post_id: $scope.postId}

      $scope.addComment = ->
        Comment.save($scope.comment, (data) ->
          $scope.comments.push(data)
          $scope.comment = {}
          $scope.commentForm.$setPristine()
        )
  }
)
