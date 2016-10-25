class InstructionSessionsController < ApplicationController


	def index
		@instruction_sessions = InstructionSession.all
	end


	def new
		@instruction_session = InstructionSession.new
		# @attendance_records = [ AttendanceRecord.new ]
	end


	def create
		@instruction_session = InstructionSession.new( instruction_session_params( params ) )

		if @instruction_session.save
			redirect_to instruction_sessions_path
		else
			 render :new
		end
	end


	def show
		@instruction_session = InstructionSession.find( params[ :id ] );
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


	private
	def instruction_session_params( params )
		params.require( :instruction_session ).permit(
			:title,
			:description,
			attendance_records_attributes: [ :user_id, :instruction_session_id ]
			)
	end
end
