class InstructionSession < ActiveRecord::Base
	has_many :attendance_records
	has_many :students, through: :attendance_records

	accepts_nested_attributes_for :attendance_records
end
