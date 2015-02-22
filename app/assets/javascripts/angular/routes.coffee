angular.module('ajsBlog').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/')

  $stateProvider
    .state('root', {
      url: '',
      abstract: true,
      views: {
        header: {
          controller: 'HeaderCtrl',
          template: JST['angular/templates/global/header']
        }
      }
    })
    .state('root.posts', {
      url: '/',
      data: {
        roles: []
      },
      views: {
        'body@': {
          controller: 'PostsCtrl',
          template: JST['angular/templates/posts/posts']
        }
      }
    })
    .state('root.post', {
      url: '/posts/:id',
      data: {
        roles: []
      },
      views: {
        'body@': {
          controller: 'PostCtrl',
          template: JST['angular/templates/posts/post']
        }
      }
    })
