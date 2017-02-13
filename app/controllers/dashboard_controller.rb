class DashboardController < ApplicationController

	def index
		@recent_instruction_sessions = InstructionSession.where( { :user_id => current_user.id } ).last( 3 )
	end
end
