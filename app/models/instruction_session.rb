class InstructionSession < ActiveRecord::Base
	has_many :attendance_records
	has_many :users, through: :attendance_records
end
