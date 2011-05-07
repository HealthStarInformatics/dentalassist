class Medicalhistory < ActiveRecord::Base

  attr_writer :current_step
  validates_presence_of :fname, :dob,:resp_dob, :if => lambda { |o| o.current_step == "about" }
  validates_presence_of :primary_insured_dob, :if => lambda { |o| o.current_step == "insurance" }

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
