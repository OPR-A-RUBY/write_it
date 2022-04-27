# Программа:
#
#
#
#
system('clear') # Linux

require 'net/http'
require 'uri'

# -------------------------------------------------------------------------------
class Air
	attr_reader :a
	attr_writer :b
	attr_accessor :c
	def initialize par1, par2, ...
		@a = par1
		@b = par2
		@arr = [ ... ]
		@hh = { ... }
	end
	def fly
	end
end
# =============================================================== B E G I N =====
input = File.open "in.txt", "r"
while (line = input.gets)
	line.strip!
end
input.close
# =================================================================== E N D =====