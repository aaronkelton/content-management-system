class PagesController < ApplicationController
  def new
  end

  def create
    #code
  end

  def index
    @pages = Page.sorted
  end

  def show
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
end
