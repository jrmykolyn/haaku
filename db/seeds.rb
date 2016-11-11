# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Assign array of mock `Student` data.
students = [
	{ :name => 'Jeremy Kolyn', :email => 'jeremy.kolyn@test.com', :sex => 'm' },
	{ :name => 'John Smith', :email => 'john.smith@test.com', :sex => 'm' },
	{ :name => 'Jane Doe', :email => 'jane.doe@test.com', :sex => 'f' }
]

# Insert mock `Student` data into database.
students.each do | students |
	Student.create( students )
end

# Define hash of mock `InstructionSession` data.
instruction_session_opts = {
	:titles => [
		'Review of MVC Architecture',
		'Introduction to Route Helper Methods',
		'Working With Views'
	]
}

# Insert mock `InstructionSession` data into database.
10.times do | i |
	# Create new 'InstructionSession' record.
	ins = InstructionSession.new

	# Update record.
	ins.title = instruction_session_opts[:titles].sample
	ins.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc aliquet orci quis lorem fermentum convallis. Suspendisse auctor lectus eu nulla porta hendrerit. Donec eu odio eget erat cursus sollicitudin. Nullam."
	ins.date = Date.new
	ins.started_at = Time.new
	ins.ended_at = Time.new

	# Save record to database.
	ins.save

	# Attach `AttendanceRecord` data to current `InstructionSession`.
	(1..8).to_a.sample.times do | index |
		ar = AttendanceRecord.new

		ar.student_id = Student.all.sample[:id]
		ar.instruction_session_id = InstructionSession.last[:id]

		ar.save
	end
end
