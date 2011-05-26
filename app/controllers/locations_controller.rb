class LocationsController < ApplicationController
  def index
    if require_loc_admin
      @locations = Location.where("user_id = ?", current_user.id)
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    @location.user_id = current_user.id
    if @location.save
      redirect_to @location, :notice => "Successfully created locations."
    else
      render :action => 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.user_id = current_user.id
    print params[:location].to_yaml
    if @location.update_attributes(params[:location])
      print "yo"
      redirect_to @location, :notice  => "Successfully updated locations."
    else
      print "yono"
      render :action => 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_url, :notice => "Successfully destroyed locations."
  end
end
