class CreateAttendanceRecords < ActiveRecord::Migration
  def change
    create_table :attendance_records do |t|
      t.integer :user_id
      t.integer :instruction_session_id

      t.timestamps null: false
    end
  end
end
