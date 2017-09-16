class AdminUsersController < ApplicationController

  layout 'admin'

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
