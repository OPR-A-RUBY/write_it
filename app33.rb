hh = {}

loop do
  print "Enter produt id: "
  id = gets.chomp

  print "Enter the quantity (how many item you want to order): "
  n  = gets.chomp.to_i

  x = hh[id].to_i  # read hash value (0 if it's don't exist)
  x = x + n        # increase by n
  hh[id] = x       # set hash value 

  puts hh.inspect
  puts "="*15

end
