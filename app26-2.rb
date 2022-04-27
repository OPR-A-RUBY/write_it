# 
# -------------------------------------------------------------------------------
def is_your_password_weak? pass
  input = File.open "password.txt", "r"
  while (line = input.gets)
    line.strip!
    if pass == line
      return true
    end
  end
  return false
end
# =============================================================== B E G I N =====
print "Enter your password: "
your_pass = gets.strip

if is_your_password_weak? your_pass
  puts "Your password #{your_pass} is weak!"
else
  puts "Your password #{your_pass} is NOT weak!"
end
# =================================================================== E N D =====
