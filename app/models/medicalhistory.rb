class Medicalhistory < ActiveRecord::Base
  attr_accessible :fname, :lastname, :sex, :marital, :dob, :age, :ssn, :address, :city, :state, :zip, :home_phone, :biss_phone, :cell_phone, :pager, :email, :emp, :emp_term, :occupation, :emp_address, :emp_city, :emp_zip, :emp_state, :emp_city, :medical_conditions

  attr_writer :current_step
  validates_presence_of :fname, :if => lambda { |o| o.current_step == "about" }
  validates_presence_of :resp_name, :if => lambda { |o| o.current_step == "" }

def current_step
  @current_step ||  steps.first
end


def steps
  %w[about insurance medical dental consent]
end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
  
  def first_step?
    current_step == steps.first
  end
  
  def last_step?
    current_step == steps.last
  end
  
  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

end
