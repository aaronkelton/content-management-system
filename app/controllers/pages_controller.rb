class PagesController < ApplicationController

  layout 'admin'

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
end
