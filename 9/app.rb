numbers = []
File.open('input.txt','r').each { |num| numbers << num.to_i }

start_array = numbers[25, numbers.length-1]
puts start_array.inspect

start_array.each_with_index do |num, index|
  puts "index: #{index}"
  preamble = numbers[index, 25]
  puts "preamble: #{preamble.inspect}"
  raise "preamble must be 25 in length it is #{preamble.length}"  if preamble.length != 25

  answer = nil
  preamble.each do |preamble_num, pindex|
    answer = preamble.detect do |n|
      puts "checking if #{n} + #{preamble_num} == #{num}, answer is #{(n + preamble_num)}"
      (n + preamble_num) == num
    end
    puts "answer: #{answer}"
    break unless answer.nil?
  end
  if answer.nil?
    puts "answer is #{num}"
    exit
  end
end