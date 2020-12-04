require_relative './landscape'

landscape_data = File.read('input.txt').split(/\s/)
landscape = Landscape.new(landscape_data)

count1 = landscape.count_trees(1, 1)
count2 = landscape.count_trees(3, 1)
count3 = landscape.count_trees(5, 1)
count4 = landscape.count_trees(7, 1)
count5 = landscape.count_trees(1, 2)

answer = count1 * count2 * count3 * count4 * count5
puts "the answer is #{answer}"
