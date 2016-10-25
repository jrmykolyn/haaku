class InstructionSessionsController < ApplicationController


	def index
		@instruction_sessions = InstructionSession.all
	end


	def new
		@instruction_session = InstructionSession.new
	end


	def create
		# ...
	end


	def show
		# ...
	end


	def edit
		# ...
	end


	def update
		# ...
	end


	def destroy
		# ...
	end


end
