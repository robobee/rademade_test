module Api

  class ProductsController < ApplicationController

    def index
      per_page = safe_per_page
      @products = Product.paginate(:page => safe_page, :per_page => per_page)
      render json: @products, meta: { total_products: Product.count,
                                      products_per_page: per_page }
    end

    def show
      if @product = Product.find_by(alias_name: params[:alias_name])
        render json: @product
      else
        render json: {}, status: 404
      end
    end

    private

      def safe_page
        if params.has_key?(:page) && is_valid_integer(params[:page])
          params[:page]
        else
          page_default
        end
      end

      def safe_per_page
        if params.has_key?(:per_page) && is_valid_integer(params[:per_page])
          params[:per_page]
        else
          per_page_default
        end
      end

      def is_valid_integer(param)
        param.match(/\A\d+\Z/) && param.to_i > 0
      end

      def per_page_default
        3
      end

      def page_default
        1
      end
  end

end
