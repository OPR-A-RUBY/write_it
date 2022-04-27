def find_and_replace(dir)

	Dir[dir + '/*.cs'].each do |name|

		print "Processing #{name} ..."
		File.open(name, "r+:UTF-8") do |f|

			new_file = f.read.gsub(/TaskThem\.Web\./, 'TaskThem.Core.')
			f.truncate 0
			f.write new_file

		end
		puts "Ok"

	end
	Dir[dir + '/*/'].each(&method(:find_and_replace))

end

find_and_replace '.'

# Lesson_07 time: 20:47
