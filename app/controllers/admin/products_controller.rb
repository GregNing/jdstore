class Admin::ProductsController < ApplicationController
    before_action :authenticate_user!, only: [:new,:create,:show,:edit,:update,:destroy ]
    before_action :find_products_id, only: [:show,:edit,:update,:destroy ]
    before_action :admin_required
    def index
        @products = Product.all.descbycreatetime.paginate(page: params[:page], per_page: 5 )        
    end
    def new
        @products = Product.new
    end
    def create
        @products = Product.new(products_params)
        @products.user = current_user
        if @products.save
            redirect_to admin_products_path,notice: "#{@products.title}新增成功!"
        else
            render :new
        end
    end
    def show
        
    end
    def edit        
    end
    def update         
        if @products.update(products_params)
            redirect_to admin_products_path,notice: "#{@products.title}修改成功!"
        else
            render :edit
        end
    end
    def destroy
        @products.destroy
        redirect_to admin_products_path,alert: "#{@products.title}刪除成功!"
    end    
    private
    def find_products_id
        @products = Product.find(params[:id])
    end

    def products_params
        params.require(:product).permit(:title,:description,:quantity,:price)        
    end
end
