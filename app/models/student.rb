class Student < ActiveRecord::Base
	has_many :attendance_records
	has_many :instruction_sessions, through: :attendance_records
	belongs_to :cohort
end
