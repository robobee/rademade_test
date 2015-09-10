app.controller 'ProductCatalogCtrl', [ '$scope', 'Product', 'products', ($scope, Product, products) ->

  init = () ->
    $scope.products = products
    $scope.totalProducts = products.totalProducts
    $scope.productsPerPage = 3
    $scope.currentPage = 1

  init()

  $scope.$watch 'currentPage', (newValue, oldValue) ->
    if newValue != oldValue
      getResultsPage newValue

  $scope.$watch 'productsPerPage', (newValue, oldValue) ->
    if newValue != oldValue
      if $scope.currentPage = 1
        getResultsPage $scope.currentPage
      else
        $scope.currentPage = 1

  $scope.setProductsPerPage = (num) ->
    $scope.productsPerPage = num

  getResultsPage = (pageNumber) ->
    Product.query({ page: pageNumber, perPage: $scope.productsPerPage }).then (products) ->
      $scope.products = products
      $scope.totalProducts = products.totalProducts
]
