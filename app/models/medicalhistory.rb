class Medicalhistory < ActiveRecord::Base
  attr_accessor :appointment, :aptmt_date, :aptmt_time



  before_update :check_boxes
  belongs_to :user #user_id
  accepts_nested_attributes_for :user
  belongs_to :location #location_id
  


  
  attr_writer :current_step, :user_creation
  validates_presence_of :fname, :dob,:resp_dob,:user, :if => lambda { |o| o.current_step == "about" }
  validates_presence_of :primary_insured_dob, :if => lambda { |o| o.current_step == "insurance" }
  validate :user, :if => lambda {|o| o.current_step == "insurance"}

  def validate
    if current_step == "consent" and !"#{fname.strip} #{lastname.strip}".eql?(signature) 
      errors.add(:signature, "doesn't match")
    end
    if current_step == "consent" and !signature_date.eql?(Date.today.to_s)
      errors.add(:signature_date, "doesn't match")
    end
  end

def current_step 
  @current_step ||  steps.first
end

def user_creation
  @user_creation || user_creation_options.first
end

def already_created_user
  self.user_creation
end

def steps
  %w[about insurance medical dental consent appointment]
end

def user_creation_options
  %w[notyet created]
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
  
def second_step?
  current_step == steps.second
end
  
def all_valid?
  steps.all? do |step|
    self.current_step = step
    valid?
  end
end

  private
    def check_boxes
    checked_conditions = []
    if medical_conditions != nil
      medical_conditions.each do |condition|
        checked_conditions.push(condition) unless condition.length <= 1
      end
      checked_conditions = checked_conditions.join(",")
      medical_conditions = checked_conditions
    end
  end
end
