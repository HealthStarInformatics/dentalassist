class AvailableTimesController < ApplicationController
  def index
    @available_times = AvailableTimes.all
  end

  def show
    @available_times = AvailableTimes.find(params[:id])
  end

  def new
    @available_times = AvailableTimes.new
  end

  def create
    @available_times = AvailableTimes.new(params[:available_times])
    if @available_times.save
      redirect_to @available_times, :notice => "Successfully created available times."
    else
      render :action => 'new'
    end
  end

  def edit
    @available_times = AvailableTimes.find(params[:id])
  end

  def update
    @available_times = AvailableTimes.find(params[:id])
    if @available_times.update_attributes(params[:available_times])
      redirect_to @available_times, :notice  => "Successfully updated available times."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @available_times = AvailableTimes.find(params[:id])
    @available_times.destroy
    redirect_to available_times_url, :notice => "Successfully destroyed available times."
  end
end
