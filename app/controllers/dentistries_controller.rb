class DentistriesController < ApplicationController
  def index
    @dentistries = Dentistry.all
  end

  def show
    @dentistry = Dentistry.find(params[:id])
  end

  def new
    @dentistry = Dentistry.new
  end

  def create
    @dentistry = Dentistry.new(params[:dentistry])
    if @dentistry.save
      redirect_to @dentistry, :notice => "Successfully created dentistry."
    else
      render :action => 'new'
    end
  end

  def edit
    @dentistry = Dentistry.find(params[:id])
  end

  def update
    @dentistry = Dentistry.find(params[:id])
    if @dentistry.update_attributes(params[:dentistry])
      redirect_to @dentistry, :notice  => "Successfully updated dentistry."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @dentistry = Dentistry.find(params[:id])
    @dentistry.destroy
    redirect_to dentistries_url, :notice => "Successfully destroyed dentistry."
  end
end
