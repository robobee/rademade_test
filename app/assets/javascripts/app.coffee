window.app = angular.module('app', [
  'ui.router',
  'ngSanitize',
  'rails',
  'appResource',
  'templates',
  'angularUtils.directives.dirPagination'
]).config([
  '$stateProvider', '$urlRouterProvider', '$locationProvider',
  ($stateProvider, $urlRouterProvider, $locationProvider) ->

    $stateProvider
    .state 'public',
      abstract: true,
      url: '',
      templateUrl: 'layouts/index.html',
      controller: 'LayoutCtrl'

    .state 'public.productCatalog',
      url: '/',
      templateUrl: 'views/product-catalog.html',
      controller: 'ProductCatalogCtrl'
      # ,
      # resolve: {
      #   productResource: "Product",
      #   products: (productResource) ->
      #     productResource.get()
      # }

    .state 'public.productDetail',
      url: '/:aliasName',
      templateUrl: 'views/product-detail.html',
      controller: 'ProductDetailCtrl',
      resolve: {
        productResource: "Product",
        product: (productResource, $stateParams) ->
          productResource.get($stateParams.aliasName)
      }

    $urlRouterProvider.otherwise '/'

    $locationProvider.html5Mode
      enabled: true
      requireBase: false
      html5Mode: true

]).run [ "$rootScope", ($rootScope) ->

]
