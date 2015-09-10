module Api

  class ProductsController < ApplicationController

    def index
      @products = Product.paginate(:page => safe_page_param, :per_page => 3)
      render json: @products, meta: { total_products: Product.count }
    end

    def show
      if @product = Product.find_by(alias_name: params[:alias_name])
        render json: @product
      else
        render json: {}, status: 404
      end
    end

    private

      def safe_page_param
        if params.has_key?(:page) && page_is_valid(params[:page])
          params[:page]
        else
          1
        end
      end

      def page_is_valid(page)
        page.match(/\A\d+\Z/) && page.to_i > 0
      end

  end

end
