require_relative './landscape'

landscape_data = File.read('input.txt').split(/\s/)
landscape = Landscape.new(landscape_data)

count = landscape.count_trees(3, 1)
puts "tree count: #{count}"