class Question
  attr_accessor :yes
end


data = File.read('input.txt').split(/\s\s/).map do |d|
  lines = d.split(/\s/)
  questions = lines.map do |line|
    puts "line: #{line.inspect}"
    line.chars.uniq
  end.flatten
  puts "question: #{questions.uniq}"
  questions.uniq
end
#puts data.inspect

count = 0
data.each do |group|
  #puts "handling #{group.join} which is adding #{group.length}"
  count += group.length
end
puts "answer is #{count}"