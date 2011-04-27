class MedicalhistoriesController < ApplicationController
  def index
    @medicalhistories = Medicalhistory.all
  end

  def show
    @medicalhistory = Medicalhistory.find(params[:id])
  end

  def new
	session[:medicalhistory_params] ||= {}
	@medicalhistory = Medicalhistory.new(session[:medicalhistory_params])	
	@medicalhistory.current_step = session[:form_step]
  end

  def create
    session[:medicalhistory_params].deep_merge!(params[:medicalhistory]) if params[:medicalhistory]
    @medicalhistory= Medicalhistory.new(session[:medicalhistory_params])
    @medicalhistory.current_step = session[:form_step]
    if @medicalhistory.valid?
      if params[:back_button]
        @medicalhistory.previous_step
      elsif @medicalhistory.last_step?
        @medicalhistory.save if @medicalhistory.all_valid?
      else
        @medicalhistory.next_step
      end
      session[:form_step] = @medicalhistory.current_step
    end
    if @medicalhistory.new_record?
      render "new"
    else
      session[:form_step] = session[:medicalhistory_params] = nil
      flash[:notice] = "Form Saved!"
      redirect_to @medicalhistory
    end
  end

  def edit
    @medicalhistory = Medicalhistory.find(params[:id])
  end

  def update
    @medicalhistory = Medicalhistory.find(params[:id])
    if @medicalhistory.update_attributes(params[:medicalhistory])
      redirect_to @medicalhistory, :notice  => "Successfully updated medicalhistory."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @medicalhistory = Medicalhistory.find(params[:id])
    @medicalhistory.destroy
    redirect_to medicalhistories_url, :notice => "Successfully destroyed medicalhistory."
  end
end
