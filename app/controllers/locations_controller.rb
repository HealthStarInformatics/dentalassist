class LocationsController < ApplicationController
  def index
    @locations = Locations.all
  end

  def show
    @locations = Locations.find(params[:id])
  end

  def new
    @locations = Locations.new
  end

  def create
    @locations = Locations.new(params[:locations])
    if @locations.save
      redirect_to @locations, :notice => "Successfully created locations."
    else
      render :action => 'new'
    end
  end

  def edit
    @locations = Locations.find(params[:id])
  end

  def update
    @locations = Locations.find(params[:id])
    if @locations.update_attributes(params[:locations])
      redirect_to @locations, :notice  => "Successfully updated locations."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @locations = Locations.find(params[:id])
    @locations.destroy
    redirect_to locations_url, :notice => "Successfully destroyed locations."
  end
end
