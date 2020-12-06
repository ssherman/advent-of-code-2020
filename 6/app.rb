data = File.read('input.txt').split(/\s\s/).map do |d|
  lines = d.split(/\s/)
  questions = lines.map do |line|
    line.chars.uniq
  end.flatten
  questions.uniq
end

count = 0
data.each do |group|
  count += group.length
end
puts "answer is #{count}"