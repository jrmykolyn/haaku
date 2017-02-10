class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.date :start_date

      t.timestamps null: false
    end
  end
end
