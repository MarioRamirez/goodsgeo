class ProductsController < ApplicationController
	before_action :find_product, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@product = Product.all.order("created_at DESC")
	end

	def show
	end

	def new
		@product = current_user.products.build
	end

	def create
		@product = current_user.products.build(product_params)

		if @product.save
			redirect_to @product, notice: "Product created successfully."
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @product.update(product_params)
			redirect_to @product, notice: "Product updated successfully."
		else
			render 'edit'
		end
	end

	def destroy
		@product.destroy
		redirect_to root_path, notice: "Product deleted successfully."
	end

	private

	def product_params
		params.require(:product).permit(:name, :description, :image)
	end

	def find_product
		@product = Product.find(params[:id])
	end
end