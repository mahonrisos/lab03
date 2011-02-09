class Appointment < ActiveRecord::Base
	belongs_to :patient
	belongs_to :medic

	def assignAppointment(medic_id , patient_id , begin_time , end_time)
		# first verify the doctor don't have any other appointment
		temp_appointment = Appointment.find(:all).where("medic_id = ? OR patient_id = ?", medic_id , patient_id)
		if temp_appointment.exists?
			# here will validate that the time won't overlap
			temp_appointment = temp_appointment.find(:all).where("begin_time < ? AND end_time > ?" , end_time , begin_time)
			if temp_appointment.exists?
				puts "can't create the appointment, the medic or patient already has another appointment that overlaps!!!"
				return false
			else
				# means the patient and the medic has NO appintment
				new_appointment = Appointment.create!(:medic_id => medic_id ,
																							:patient_id => patient_id , 
																							:begin_time => begin_time ,
																							:end_time => end_time)
				new_appointment.save
				puts "Appointment created!!"
			end
		else
			# means the patient and the medic has NO appintment
			new_appointment = Appointment.create!(:medic_id => medic_id ,
																						:patient_id => patient_id , 
																						:begin_time => begin_time ,
																						:end_time => end_time)
			new_appointment.save
			puts "Appointment created!!"
		end
	end

	def modifyAppointment(appointment_id , medic_id , begin_time , end_time)
		temp_appointment = Appointment.find(appointment_id)
		if temp_appointment.exists?
			temp_appointment(:medic_id => medic_id , :begin_time => begin_time , :end_time => end_time)
			temp_appointment.save
			puts "Appointment succesfuly modified!!"
		else
			puts "Appointment with id " + appointment_id + " don't exists"
		end
	end

	def deletAppointment(appointment_id)
		temp_appointment = Appointment.find(appointment_id)
		if temp_appointment.exists?
			temp_appointment.delete
			puts "Appointment succesfuly deleted!!"
		else
			puts "Appointment with id " + appointment_id + " don't exists"
		end
	end

end
