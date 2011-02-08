class Appointment < ActiveRecord::Base
	belongs_to :patient, :medic
end
