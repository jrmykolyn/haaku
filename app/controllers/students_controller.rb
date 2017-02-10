class StudentsController < ApplicationController


	def index
		if request.xhr?

			@students = Student.where( "name LIKE ?", "%#{params[:user_name]}%" )

			render :json => @students
		else

			@students = Student.all

			begin
				@students.length
			rescue
				@students = [ @students ]
			end

		end
	end


	def show
		@student = Student.find( params[:id] )
	end


end
