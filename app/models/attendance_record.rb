class AttendanceRecord < ActiveRecord::Base
	belongs_to :user
	belongs_to :instruction_session
end
