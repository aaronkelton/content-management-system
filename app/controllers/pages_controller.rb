class PagesController < ApplicationController

  layout 'admin'

  before_action :find_and_sort_subjects, only: [:new, :create, :edit, :update]

  def new
    @page = Page.new
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully!"
      redirect_to pages_path
    else
      @page_count = Page.count + 1
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
    @page_count = Page.count
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page upated successfully!"
      redirect_to page_path(@page)
    else
      @page_count = Page.count
      render template: 'edit'
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
end
