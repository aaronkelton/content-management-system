class AdminUsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      flash[:notice] = "Admin user created successfully."
      redirect_to access_menu_path
    else
      render 'new'
    end
  end

  def index
    @admin_users = AdminUser.ordered_by_last_name_first_name
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = "Admin user updated successfully."
      redirect_to access_menu_path
    else
      render 'edit'
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
  end

  private

    def admin_user_params
      params.require(:admin_user).permit(:first_name, :last_name, :username, :email, :password)
    end
end
