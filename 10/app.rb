class Adapter
  attr_accessor :output_joltage
  def initialize(output_joltage)
    @output_joltage = output_joltage
  end

  def can_produce_output?(input)
    (@output_joltage - 3) <= input
  end

  def difference(input)
    (@output_joltage - input).abs
  end
end

class Device
  attr_accessor :adapter
  def initialize(highest_rated_adapter)
    adapter = Adapter.new(highest_rated_adapter + 3)
  end
end

data = []
File.open('input.txt','r').each { |num| data << num.to_i }
data.sort!
puts data.inspect

bag = []

adapters = data.map { |d| Adapter.new(d) }

start_input = 0
output = {}
adapters.each do |adapter|
  if adapter.can_produce_output?(start_input)
    puts "Adapter can produce #{start_input} because it does #{adapter.output_joltage}"
    diff = adapter.difference(start_input)
    if output[diff].nil?
      output[diff] = 0
    end
    output[diff] += 1
    start_input = adapter.output_joltage
  end
end

puts "output: #{output.inspect}"
puts "the answer is #{output[1] * output[3]}"