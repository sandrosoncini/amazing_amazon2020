class ProductsController < ApplicationController
    def index
        @products= Product.all.order(created_at:  :desc)
    end

    def new
        @products= Product.new
    end

    def create
    end

end
