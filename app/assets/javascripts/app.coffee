window.app = angular.module('app', [
  'ui.router',
  'ngSanitize',
  'rails',
  'appResource',
  'templates'
]).config([
  '$stateProvider', '$urlRouterProvider', '$locationProvider',
  ($stateProvider, $urlRouterProvider, $locationProvider) ->

    $stateProvider
    .state 'public',
      abstract: true,
      url: '',
      templateUrl: 'layouts/index.html',
      controller: 'LayoutCtrl'

    .state 'public.catalog',
      url: '/',
      templateUrl: 'views/catalog.html',
      controller: 'CatalogCtrl'

    .state 'productDetail',
      url: '/:alias_name',
      templateUrl: 'views/product-detail.html',
      controller: 'ProductDetailCtrl'

    $urlRouterProvider.otherwise '/'

    $locationProvider.html5Mode
      enabled: true
      requireBase: false
      html5Mode: true

]).run [ "$rootScope", ($rootScope) ->

]
