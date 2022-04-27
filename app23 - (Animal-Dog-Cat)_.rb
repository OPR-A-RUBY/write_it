# ------------------------------------------------------------------
	class Animal
	
	  def initialize name
	    @name = name
	  end	
	  
	  def run
        puts "#{@name} is runing ..."
	  end
	  
	  def jump
	    puts "#{@name} is jumping ..."
	  end
	
	end
# ------------------------------------------------------------------
	class Dog < Animal
	  def initialize
	    super 'dog'
	  end  
	  def say
	    puts 'dog say: Woof-woof!'
	  end
	end	
# ------------------------------------------------------------------
	class Cat < Animal
	  def initialize
	    super 'cat'
	  end
	  def say
	    puts 'cat say: Meeeoooow!'
	  end 
	end
# ================================================== B E G I N =====
	cat = Cat.new
	cat.jump
	cat.run
	cat.say
				puts
	dog = Dog.new
	dog.jump
	dog.run
	dog.say
# ====================================================== E N D =====
