class AdminUserController < ApplicationController
  
  layout "admin"
  
  before_action :confirm_logged_in
  
  def index
	@users = AdminUser.sorted
  end
  
  def new
	@user = AdminUser.new
  end
  
  def create
	@user = AdminUser.new(user_params)
  end
  
  def edit
	@user = AdminUser.find(params[:id])
  end
  
  def update
	@user = AdminUser.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:notice] = "User Updated Successfully"
			redirect_to(:action => 'index', :id=>@admin_user.id) #redirect to the index page
		else
			render('edit') #if update fails, allow the user to update info
		end
  end
  
  def delete
	@user = AdminUser.find(params[:id])
  end
  
  def destroy
	user = AdminUser.find(params[:id]).destroy
	flash[:notice] = "Admin User '#{admin_user.username}' Deleted Successfully"
	redirect_to(:action => 'index')
  end
  
  private 
  def user_params
	params.require(:admin_user).permit(:first_name, :last_name, :email, :username)
  end
  
end
