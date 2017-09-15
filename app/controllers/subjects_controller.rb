class SubjectsController < ApplicationController

  layout 'admin'

  before_action :set_subject_count, only: [:new, :create, :edit, :update]

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
      flash[:notice] = "Subject created successfully!"
      redirect_to subjects_path
    else
      # If save fails, redisplay the form so user can fix problems
      render 'new'
    end
  end
  #### END CREATE ####

  #### READ ####
  def index
    logger.debug("*** Testing the logger. ***")
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
      flash[:notice] = "Subject upated successfully!"
      redirect_to subject_path(@subject)
    else
      # If save fails, redisplay the form so user can fix problems
      render 'edit'
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
    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully!"
    redirect_to subjects_path
  end
  ### END DELETE ###

  private

    def subject_params
      # params[:subject] # <- mass assignment disallowed!
      params.require(:subject).permit(:name, :position, :visible, :created_at)
    end

    def set_subject_count
      @subject_count = Subject.count
      @subject_count += 1 if params[:action] == 'new' || params[:action] == 'create'
    end
end
