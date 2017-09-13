class SectionsController < ApplicationController
  def new
  end

  def create
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
end
