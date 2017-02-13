class AddUserIdToInstructionSession < ActiveRecord::Migration
  def change
    add_column :instruction_sessions, :user_id, :integer
  end
end
