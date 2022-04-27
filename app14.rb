puts 'Errors: '
1000.times do 
  
  print rand(30..120).chr
  
  sleep rand(0.01..0.3)
  
  if rand(80) == 0 
    print "\r"
  end
 
end
