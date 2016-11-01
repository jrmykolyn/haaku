class DashboardController < ApplicationController

	def index
		@recent_instruction_sessions = InstructionSession.last(5)
	end
end
