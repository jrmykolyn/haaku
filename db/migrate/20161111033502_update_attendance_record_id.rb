class UpdateAttendanceRecordId < ActiveRecord::Migration
  def change
	remove_column :attendance_records, :user_id
	add_column :attendance_records, :student_id, :integer
  end
end
