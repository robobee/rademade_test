window.app = angular.module('app', [
  'ui.router',
  'ngSanitize',
  'rails',
  'appResource',
  'templates',
  'angularUtils.directives.dirPagination'
]).run [ "$rootScope", ($rootScope) ->

]
