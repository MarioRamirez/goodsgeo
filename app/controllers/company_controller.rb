class CompanyController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_data

  def check_data
    @user = current_user
    if @user.company.nil?
      @user.company = Company.new
    end
  end

  def edit
    @company = current_user.company
  end

  def update
    respond_to do |format|
      if @user.company.update_attributes(company_params)
        format.html { redirect_to root_path, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.company.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :address, :website, :email, :phone)
  end

end