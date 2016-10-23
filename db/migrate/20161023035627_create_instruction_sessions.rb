class CreateInstructionSessions < ActiveRecord::Migration
  def change
    create_table :instruction_sessions do |t|
      t.string :title
      t.text :description
      t.date :date
      t.time :started_at
      t.time :ended_at

      t.timestamps null: false
    end
  end
end
