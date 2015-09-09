app.factory 'Product', ['AppModel', (AppModel) ->

  class Product extends AppModel
    @configure url: '/products', name: 'product'
]
