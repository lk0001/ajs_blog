angular.module('ajsBlog').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/')

  $stateProvider
    .state('home', {
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
