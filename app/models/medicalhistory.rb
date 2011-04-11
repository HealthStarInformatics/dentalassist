class Medicalhistory < ActiveRecord::Base
  attr_accessible :fname, :lastname, :sex, :marital, :dob, :age, :ssn, :address, :city, :state, :zip, :home_phone, :biss_phone, :cell_phone, :pager, :email, :emp, :emp_term, :occupation, :emp_address, :emp_city, :emp_zip, :emp_state, :emp_city
end
