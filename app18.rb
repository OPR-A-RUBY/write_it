# ПРОГРАММА "Имя - Возраст - 2"
#

@hh = {}
def add_person name, age
# добавляет пару в хэш
	puts 'Already exsist!' if @hh[name]
	@hh[name] = age
end

def show_hash 
# выводит полностью весь хэш
	@hh.each do |key, value|
		puts "#{key} - #{value}"
	end
end

loop do
# 
	print 'Enter name: '
	name = gets.chomp.capitalize
	
	break if name == ''
	
	print 'Enter age: '
	age = gets.to_i
	
	add_person name, age
	
	show_hash 
	
end 	

puts
show_hash 
# конец программы "Имя - Возраст - 2"
