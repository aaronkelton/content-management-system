class PagesController < ApplicationController

  layout 'admin'
  before_action :confirm_logged_in
  before_action :find_and_sort_subjects, only: [:new, :create, :edit, :update]
  before_action :set_page_count, only: [:new, :create, :edit, :update]

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully!"
      redirect_to pages_path
    else
      render 'new'
    end
  end

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page upated successfully!"
      redirect_to page_path(@page)
    else
      render 'edit'
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page destroyed successfully!"
    redirect_to pages_path
  end

  private
    def page_params
      params.require(:page).permit(:name, :visible, :position, :permalink, :subject_id)
    end

    def find_and_sort_subjects
      @subjects = Subject.sorted
    end

    def set_page_count
      @page_count = Page.count
      @page_count += 1 if params[:action] == 'new' || params[:action] == 'create'
    end
end
