class PagesController < ApplicationController
  def new
    @page = Page.new(name: 'Default page')
  end

  def create
    # Instantiate a new object using form params
    @page = Page.new(page_params)
    # Save the object
    if @page.save
      # If save succeeds, redirect to the index action
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
  end

  def update
    #code
  end

  def delete
  end

  def destroy
    #code
  end

  private
    def page_params
      params.require(:page).permit(:name, :visible, :position, :permalink)
    end
end
