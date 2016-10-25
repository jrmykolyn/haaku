class StudentsController < ApplicationController


	def index
		if request.xhr?

			@students = User.where( "role = ? AND name LIKE ?", "student", "%#{params[:user_name]}%" )

			render :json => @students
		else

			@students = User.where( { :role => 'student' } )

			begin
				@students.length
			rescue
				@students = [ @students ]
			end

		end
	end


end
