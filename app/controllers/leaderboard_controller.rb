class LeaderboardController < ApplicationController


    def index
        @students = Student.all.sort_by do | student |
            puts student.attendance_records.length
            student.attendance_records.length
        end
    end


end
