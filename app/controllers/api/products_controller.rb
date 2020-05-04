class Api::ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token


    def all_product
        @products = Product.all
        render json:{
			      response_code: 200,
			      response_message: "OK",
			      products: @products
	    	}

    end

    def create_product
        @product = Product.new(product_params)
        if @product.valid?
            @product.save
            render json:{
			      response_code: 200,
                  response_message: "OK" }
        else
            raise Error::CustomError unless @product.valid?
        end
    end

    def find_product
        @product = Item::Product.find(params[:id])
        render json: {
        status: 200,
        product: @product
        }
    end

    protected

	def product_params
	  params.permit(:name,:price,:short_description,:full_description)      
	end

end