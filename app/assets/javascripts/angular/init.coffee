app = angular.module('ajsBlog', [
  'ui.router',
  'header-module',
  'posts-module'
])

app.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

app.config ($locationProvider) ->
  $locationProvider.html5Mode(true)
