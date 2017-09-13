class SubjectsController < ApplicationController

  ###### CREATE ######
  def new
    @subject = Subject.new(name: 'Default')
  end

  def create
    # Instantiate a new object using form params
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index action
      redirect_to subjects_path
    else
      # If save fails, redisplay the form so user can fix problems
      render template: 'new'
    end
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
    @subject = Subject.find(params[:id])
  end

  def update
    # Find a new object using form params
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
      # If save succeeds, redirect to the show action
      redirect_to subject_path(@subject)
    else
      # If save fails, redisplay the form so user can fix problems
      render template: 'edit'
    end
  end
  ### END UPDATE ###

  ### DELETE ###
  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to subjects_path
  end
  ### END DELETE ###

  private

    def subject_params
      # params[:subject] # <- mass assignment disallowed!
      params.require(:subject).permit(:name, :position, :visible)
    end
end
