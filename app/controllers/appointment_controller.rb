class AppointmentController < ApplicationController
  def index
    if location_admin?
      a = Location.select(:id).where("user_id = ?", current_user.id).collect(&:attributes)
      b = []
      a.each do |i|
        b << i["id"]
      end
      @appointments = Appointment.where("location_id in (?)",b )
    elsif normal_user?
      @appointments = Appointment.where("user_id = ?", current_user.id) 
    end
  end

end
