# ================================================== B E G I N =====
input = File.open "password.txt", "r"

print "Enter your password: "
your_pass = gets.strip

i = 0
while (line = input.gets)
  line.strip!
  i += 1
  if your_pass == line
    puts
    puts "Your password #{your_pass} is weak!"
    exit
  end
  print ". #{i} - Working: #{line} "+" "*15+"\r"
  sleep 0.005                
end

puts
puts "Your password #{your_pass} is NOT weak!"

# ====================================================== E N D =====
