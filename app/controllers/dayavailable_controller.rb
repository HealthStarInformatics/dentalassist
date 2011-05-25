class DayavailableController < ApplicationController
  def index
    @days = Dayavailable.where("time is null and upper(name) like ?", "%#{params[:q].upcase}%")
    respond_to do |format|
      format.html
      format.json {render :json => @days.map(&:attributes)}
    end
  end

end
