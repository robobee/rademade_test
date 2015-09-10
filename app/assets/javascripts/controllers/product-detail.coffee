app.controller 'ProductDetailCtrl', [ '$scope', '$stateParams', 'product', ($scope, $stateParams, product) ->

  $scope.productDetail = product

]
