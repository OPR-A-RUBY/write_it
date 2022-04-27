# ------------------------------------------------------------------
# ================================================== B E G I N =====
input = File.open "app25 - test.txt", "r"
total_summ_1 = 0
total_summ_2 = 0
while (line = input.gets)
	arr = line.split(',')
	item_1 = arr[1].strip.to_i
	item_2 = arr[2].strip.to_r
	total_summ_1 += item_1
	total_summ_2 += item_2
end
puts "Total_summ = #{total_summ_1}"
puts "Small_summ = #{total_summ_2}"
input.close
# ====================================================== E N D =====
