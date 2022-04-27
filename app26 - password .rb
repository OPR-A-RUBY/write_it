# ================================================== B E G I N =====
input = File.open "password.txt", "r"

while (line = input.gets)
  puts line if line.strip.size == 6
end

# ====================================================== E N D =====	
# Открываем файл и читаем построчно в переменную line
