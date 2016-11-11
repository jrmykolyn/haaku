class AttendanceRecord < ActiveRecord::Base
	belongs_to :student
	belongs_to :instruction_session

	# Validations
	validates :student_id, presence: true
end
