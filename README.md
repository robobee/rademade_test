README
======

App on Heroku:
--------------
https://safe-ravine-2369.herokuapp.com/

Frontend:
---------
1. CoffeScript
2. Angular
3. angular-ui-router
4. Slim

Backend:
--------
1. Rails
2. AR
3. Active Model Serializers for json serialization

Pagination:
-----------
1. will_paginate
2. https://github.com/michaelbromley/angularUtils/tree/master/src/directives/pagination
3. Works via AJAX calls
4. "Products per page" feature. (Warning, layout breaks when choosing more than 3 products per page due to the way bootstrap floats work. Possible solutions: break products into chunks in js or include clearfixes after each chunk of products (does not work with chosen pagination and will not allow to use different number of products in the row) or fix layout.)

Tests:
------
1. RSpec
2. Capybara

Fixtures
--------
1. Generation in db/seeds.rb
