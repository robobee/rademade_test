module Api

  class ProductsController < ApplicationController

    def index
      @products = Product.all
      render json: @products
    end

    def show
      if @product = Product.find_by(params[:alias_name])
        render json: @product
      else
        render json: {}, status: 404
      end
    end

  end

end
