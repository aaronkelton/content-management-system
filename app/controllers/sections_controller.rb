class SectionsController < ApplicationController

  layout 'admin'

  def new
    @section = Section.new(name: 'Default')
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully!"
      redirect_to sections_path
    else
      render 'new'
    end
  end

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section upated successfully!"
      redirect_to section_path(@section)
    else
      render template: 'edit'
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section destroyed successfully!"
    redirect_to sections_path
  end

  private
  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content, :page_id)
  end
end
