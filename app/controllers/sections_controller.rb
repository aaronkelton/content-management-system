class SectionsController < ApplicationController
  def new
    @section = Section.new(name: 'Default')
  end

  def create
    # Instantiate a new object using form params
    @section = Section.new(section_params)
    # Save the object
    if @section.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Section created successfully!"
      redirect_to sections_path
    else
      # If save fails, redisplay the form so user can fix problems
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
    # Find a new object using form params
    @section = Section.find(params[:id])
    # Update the object
    if @section.update_attributes(section_params)
      # If save succeeds, redirect to the show action
      flash[:notice] = "Section upated successfully!"
      redirect_to section_path(@section)
    else
      # If save fails, redisplay the form so user can fix problems
      render template: 'edit'
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section '#{@section.name}' destroyed successfully!"
    redirect_to sections_path
  end

  private
  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content)
  end
end
