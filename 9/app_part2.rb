# this is VERY VERY inefficient

n = 1124361034
answers = []
numbers = []
File.open('input.txt','r').each { |num| numbers << num.to_i }


nested_size = 2
index = 0
while true
  numbers_to_check = numbers[index, nested_size]
  puts "numbers_to_check: #{numbers_to_check.inspect}"
  sum = numbers_to_check.sum
  puts "sum: #{sum} but we are looking for #{1124361034}"
  if  sum == n
    min = numbers_to_check.min
    max = numbers_to_check.max
    puts "answer is #{min + max}"
    exit
  elsif sum > n
    puts "sum is greater"
    nested_size = 2
    index += 1
  else
    nested_size += 1
  end
end