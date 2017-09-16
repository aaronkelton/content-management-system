class AdminUsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def new
  end

  def create
  end

  def index
    @admin_users = AdminUser.ordered_by_last_name_first_name
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end
end
