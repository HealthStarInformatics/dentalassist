class AddDentalHealth < ActiveRecord::Migration
  def self.up
	add_column :medicalhistories, :x_rays, :string
	add_column :medicalhistories, :feal_dentist, :string
	add_column :medicalhistories, :mouth_teeth, :string
	add_column :medicalhistories, :teeth_appearance, :string
	add_column :medicalhistories, :state_of_health, :string
	add_column :medicalhistories, :main_concerns, :string
	add_column :medicalhistories, :enhance_smile, :string
	add_column :medicalhistories, :health_level1, :string
	add_column :medicalhistories, :health_level2, :string
	add_column :medicalhistories, :health_level3, :string
	add_column :medicalhistories, :health_level4, :string
	
  end

  def self.down
  end
end
