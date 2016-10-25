class AttendanceRecord < ActiveRecord::Base
	belongs_to :user
	belongs_to :instruction_session

	# Validations
	validates :user_id, presence: true
end
