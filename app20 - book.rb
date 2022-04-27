# coding: utf-8
#
def me_line
	puts "="*30
end
	
class Book

    def initialize                      # При создании элемента класса Book ...
        @hh = Hash.new                  # ... создаётся хеш @hh
        @last_person = String.new       # ... создаётся строковая переменная
    end
    
    def add_person opt                  # Добавление элемента в хеш и запоминание персоны
        @last_person = opt[:name]
        @hh[opt[:name]] = opt[:age] 
    end

    def show_all                        # Вывод на экран содержимое хеша
        me_line
        @hh.each do |nam, vol|
            puts "|| Name: #{nam}     Age: #{vol}  ||"
        end    
        me_line
    end
    
    def hash                            # Метод возвращает хеш из объекта
        @hh
    end
    
    def last_person                     # Метод возвращает имя последней персоны
        @last_person
    end
    
end

book1 = Book.new
    
book1.add_person :name => 'Dimon', :age => 28
book1.add_person :name => 'Roman', :age => 32
book1.add_person :name => 'Sasha', :age => 47

book1.show_all

puts book1.hash

me_line
puts "Last person: #{book1.last_person}"
