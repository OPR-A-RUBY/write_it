# ПРОГРАММА "Записная книга - 1"
#

	def show_book book
		# выводит на экран записную книгу
		i=0
		puts '='*24
		book.keys.each do |key|
			i+=1
			age = book[key]
			puts "#{i}. Name: #{key}, age: #{age}"
		end
		puts '='*24
	end
	
	book1 = { 'Mike' => 45, 'Gus' => 36, 'Linda' => 48}
	show_book book1
	
	book2 = { 'Walt' => 50, 'Jessie' => 25 }
	show_book book2
	
	book3 = book1.merge book2
	show_book book3
	
# конец программы "Записная книга - 1"
