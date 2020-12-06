def get_uniq_questions(data)
  lines = data.split(/\s/)
  questions = lines.map do |line|
    line.chars.uniq
  end.flatten
  questions.uniq
end

count = 0
data = File.read('input.txt').split(/\s\s/).map do |d|
  questions = get_uniq_questions(d)
  questions_answered = questions.select do |q|
    people = d.split(/\s/)
    people.all? { |person| person.chars.include?(q) }
  end
  count += questions_answered.length
end

puts "answer is #{count}"