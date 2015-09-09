app.controller 'CatalogCtrl', [ '$scope', 'Product', ($scope, Product) ->

  Product.get().then (products)->
    $scope.products = products
    console.log products
]
