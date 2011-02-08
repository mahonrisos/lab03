class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.date :begin_time
      t.date :end_time
      t.integer :medic_id
      t.integer :patient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
