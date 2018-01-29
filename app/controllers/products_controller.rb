class ProductsController < ApplicationController
    def index
        @products = Product.all.paginate(page: params[:page], per_page: 5 )
    end
    def show
        @products = Product.find(params[:id])
    end
end
