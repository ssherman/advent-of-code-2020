numbers = File.read('input.txt').split(/\s/).map { |d| d.to_i }
numbers.each do |number|
  needed = 2020 - number;
  puts "needed: #{needed}"
  found = numbers.detect { |n| n == needed }
  if found
    puts "the numbers are #{number} and #{needed}"
    answer = number * found
    puts "Answer is: #{answer}"
    break;
  end
end
