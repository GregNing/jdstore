class ProductsController < ApplicationController
    def index
        @products = Product.all.paginate(page: params[:page], per_page: 5 )
    end
    def show
        @products = Product.find(params[:id])
    end
    def add_to_cart     
        @products = Product.find(params[:id])
       current_cart.add_product_to_cart(@products)     
       flash[:notice] = "成功加入购物车"
       redirect_to :back
    end

  def add_to_cart
    @products = Product.find(params[:id])
   if !current_cart.products.include?(@products)
     current_cart.add_product_to_cart(@products)
     flash[:notice] = "你已成功 #{@products.title} 加入購物車"
   else
     flash[:warning] = "你的購物車已有此商品"
   end
    redirect_to :back
  end
end
