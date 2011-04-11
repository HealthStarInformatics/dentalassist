class MedicalhistoriesController < ApplicationController
  def index
    @medicalhistories = Medicalhistory.all
  end

  def show
    @medicalhistory = Medicalhistory.find(params[:id])
  end

  def new
    @medicalhistory = Medicalhistory.new
  end

  def create
    @medicalhistory = Medicalhistory.new(params[:medicalhistory])
    if @medicalhistory.save
      redirect_to @medicalhistory, :notice => "Successfully submitted registration"
    else
      render :action => 'new'
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
