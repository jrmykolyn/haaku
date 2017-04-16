class CreateInstructionSessionNotes < ActiveRecord::Migration
  def change
    create_table :instruction_session_notes do |t|
      t.integer :instruction_session_id
      t.integer :student_id
      t.string :title
      t.string :text

      t.timestamps null: false
    end
  end
end
