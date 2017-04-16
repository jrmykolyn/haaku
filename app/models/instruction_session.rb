class InstructionSession < ActiveRecord::Base
	belongs_to :user
	has_many :attendance_records
	has_many :students, through: :attendance_records
	has_many :notes, foreign_key: 'instruction_session_id', class_name: 'InstructionSessionNote' # *REQUIRE* `InstructionSessionNote` instances to be accessed via `.notes` attr.

	accepts_nested_attributes_for :attendance_records
end
