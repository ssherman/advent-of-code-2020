class Bag
  # children are {count: 4, bag: Bag}
  attr_accessor :name, :color, :children, :parents
  def initialize(name)
    @name = name
    @children = {}
    @parents = []
  end
end

bags = {}
File.open('input.txt','r').each do |rule|
  puts "rule: #{rule}"
  match_data = /(.*?) bags contain\s(.*)\./.match(rule)
  first = match_data[1]

  bags[first] = {}

  puts "first: #{first}"
  additional = match_data[2].split(', ')
  additional.each do |a|
    next if a == "no other bags"
    additional_match = /([0-9]+)\s(.*)?\s(bag|bags)/.match(a)
    puts "additionalwtf: #{additional_match.inspect}"
    count = additional_match[1]
    name = additional_match[2]
    puts "count: #{count}, name: #{name}"
    bag[first][name] = count
  end

  puts "additional: #{additional.inspect}"

  puts match_data.inspect
end

bags.each do |name, children|

end


def find_total_bag_count(name, color)
  gold_bag_count = 0
  contains_gold = []
  bag = bags[name]
  bag.each do |child_name, count|
    
    puts "bag: #{bag.name} #{bag.children.inspect}"
    if bag.children.keys.include?('shiny gold')
      gold_bag_count += 1 
      puts "gold bag!!!!"
    end
  end
  
end

gold_bag_count = 0
contains_gold = []
bags.each do |bag|
  puts "bag: #{bag.name} #{bag.children.inspect}"
  if bag.children.keys.include?('shiny gold')
    gold_bag_count += 1 
    puts "gold bag!!!!"
  end
end

puts gold_bag_count