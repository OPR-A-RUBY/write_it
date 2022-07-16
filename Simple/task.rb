f = File.open('file.txt', 'r')

@hh = {}

def add_word_to_hash(word)
  #puts word
  if !word.empty?
    word.downcase!
    value = @hh[word]
    value = (value || 0) + 1
    @hh[word] = value
end
end  

f.each_line do |line|
  arr = line.split(/\s|\n|\.|,|\?|\t|\-|\>/)
  arr.each { |word| add_word_to_hash(word) }
  # puts arr.inspect 
end  

f.close

@hh.each do |key, value|

puts "#{value}  - #{key}"

end
