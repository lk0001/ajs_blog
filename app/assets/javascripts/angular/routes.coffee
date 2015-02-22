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
          controller: 'PostsController',
          template: JST['angular/templates/posts/posts']
        }
      }
    })
