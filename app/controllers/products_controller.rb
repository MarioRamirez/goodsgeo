class ProductsController < ApplicationController
	before_action :find_product, only: [:show, :edit, :update, :destroy]
	def index
	end

	def show
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def product_params
		params.require(:product).permit(:title, :description)
	end

	def find_product
		@product = Product.find(params[:id])
	end
end
