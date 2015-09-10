app.factory 'Product', ['AppModel', (AppModel) ->

  class Product extends AppModel
    @configure url: '/products', name: 'product'

    @intercept 'response', (result, resourceConstructor, context) ->
      if angular.isArray(result.data) and angular.isDefined(result.originalData.meta.total_products)
        result.data.$products = result.originalData.products
        result.data.totalProducts = result.originalData.meta.total_products
      result

]
