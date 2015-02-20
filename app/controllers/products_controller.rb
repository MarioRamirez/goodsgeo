class ProductsController < ApplicationController
	before_action :find_product, only: [:show, :edit, :update, :destroy, :follow, :unfollow]
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

	def search
		if params[:search].present?
			@products = Product.search(params[:search])
		else
			@products = Product.all
		end
	end

	def follow
	  @user = current_user

	  if current_user
      current_user.follow(@product)
      redirect_to @product, notice: "Your company was added to #{@product.name} from #{@product.place}."
	  else
	  	redirect_to user_session_path, notice: "You must login to add your company in #{@product.name} from #{@product.place}."
	  end
	end

	def unfollow
	  @user = current_user

	  if current_user
	    current_user.stop_following(@product)
	    redirect_to @product, notice: "Your company was removed of #{@product.name} from #{@product.place}."
	  else
	  	redirect_to user_session_path, notice: "You must login to remove your company in #{@product.name} from #{@product.place}."
	  end
	end

	private

	def product_params
		params.require(:product).permit(:name, :place, :latitude, :longitude, :description, :image)
	end

	def find_product
		@product = Product.find(params[:id])
	end
end