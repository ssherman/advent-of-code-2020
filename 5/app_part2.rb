require_relative './bsp'

answers = []
File.open('input.txt','r').each do |data|
  row_data = data.chars[0,7]
  seat_data = data.chars[7,9]
  bsp_row = BinarySpaceParition.new(128, row_data, 'F', 'B')
  row = bsp_row.execute
  
  bsp_seat = BinarySpaceParition.new(8, seat_data, 'L', 'R')
  seat = bsp_seat.execute
  
  answer = row * 8 + seat
  answers << answer
end

sorted_answer = answers.sort

min = sorted_answer.first
max = sorted_answer.last

missing = []
(min..max).to_a.each do |num|
  puts "num: #{num}"
  missing << num unless answers.include?(num)
end
puts missing.inspect
