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
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private
  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content)
  end
end
