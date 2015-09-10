app.controller 'ProductCatalogCtrl', [ '$scope', 'Product', ($scope, Product) ->

  $scope.currentPage = 1
  $scope.products = null
  $scope.totalProducts = 0

  Product.get().then (products) ->
    $scope.products = products
    $scope.totalProducts = products.totalProducts

  $scope.productsPerPage = 3

  $scope.$watch 'currentPage', (newValue, oldValue) ->
    if newValue != oldValue
      getResultsPage newValue

  getResultsPage = (pageNumber) ->
    Product.query({ page: pageNumber }).then (products) ->
      $scope.products = products
      $scope.totalProducts = products.totalProducts
]
