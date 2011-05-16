class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @locations = Location.find(params[:id])
  end

  def new
    @locations = Location.new
    @dentistries = Dentistry.all
  end

  def create
    @locations = Location.new(params[:location])
    print "parms@!!! #{params[:location]}" 
    print "test!!! #{@locations.name}"
    if @locations.save
      redirect_to @locations, :notice => "Successfully created locations."
    else
      render :action => 'new'
    end
  end

  def edit
    @locations = Location.find(params[:id])
  end

  def update
    @locations = Location.find(params[:id])
    if @locations.update_attributes(params[:locations])
      redirect_to @locations, :notice  => "Successfully updated locations."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @locations = Location.find(params[:id])
    @locations.destroy
    redirect_to locations_url, :notice => "Successfully destroyed locations."
  end
end
