numbers = File.read('input.txt').split(/\s/).map { |d| d.to_i }
numbers.each do |number|
  potential_next_numbers = numbers.select { |potential_num| number + potential_num < 2020 }
  potential_next_numbers.each do |second_number|
    third_number = potential_next_numbers.detect { |third_number| number + second_number + third_number == 2020 }
    if third_number
      puts "the numbers are #{number}, #{second_number}, and #{third_number}"
      answer = number * second_number * third_number
      puts "the answer is #{answer}"
      exit
    end
  end
end
