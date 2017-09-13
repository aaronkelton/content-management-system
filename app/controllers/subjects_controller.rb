class SubjectsController < ApplicationController

  ###### CREATE ######
  def new
  end

  def create
  end
  #### END CREATE ####

  #### READ ####
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end
  ### END READ ###

  ### UPDATE ###
  def edit
  end

  def update
  end
  ### END UPDATE ###

  ### DELETE ###
  def delete
  end

  def destroy
  end
  ### END DELETE ###
end
