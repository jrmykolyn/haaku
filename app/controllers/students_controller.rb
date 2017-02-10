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


	def new
		@student = Student.new
		@cohorts = Cohort.all.map { | c | [ c.name, c.id ] }
	end


	def create
		@student = Student.new( student_params( params ) )

		if @student.save
			redirect_to student_path( @student )
		else
			render :new
		end
	end


	private
	def student_params( params )
		return params.require( :student ).permit( :name, :cohort_id )
	end
end
