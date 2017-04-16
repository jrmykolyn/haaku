class InstructionSessionNote < ActiveRecord::Base
    belongs_to :instruction_session
    alias_attribute :session, :instruction_session # *ALLOW* `InstructionSession` instance to be accessed via *EITHER* the `.session` or `.instruction_session` attrs.
    belongs_to :student
end
