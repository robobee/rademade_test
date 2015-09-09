app.controller 'ProductDetailCtrl', [ '$scope', '$stateParams', 'Product', ($scope, $stateParams, Product) ->

  Product.get($stateParams.alias_name).then (product)->

    $scope.product = product
    console.log product

]
