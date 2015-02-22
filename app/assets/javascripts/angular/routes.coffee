angular.module('ajsBlog').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/')

  $stateProvider
    .state('posts', {
      url: '/',
      data: {
        roles: []
      },
      views: {
        body: {
          controller: 'PostsCtrl',
          template: JST['angular/templates/posts/posts']
        }
      }
    })
    .state('post', {
      url: '/posts/:id',
      data: {
        roles: []
      },
      views: {
        body: {
          controller: 'PostCtrl',
          template: JST['angular/templates/posts/post']
        }
      }
    })
