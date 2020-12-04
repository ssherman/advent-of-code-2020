class Landscape
  attr_accessor :rows, :right_index, :down_index, :data
  def initialize(data)
    @data = data
    @rows = data.map { |r| r.chars * data.count }
    @rows.delete_if { |r| r.empty? }
    @right_index = 0
    @down_index = 0
  end

  def move(right, down)
    @right_index += right
    @down_index += down
  end

  def done?
    @down_index > @data.count
  end

  def position
    @rows[@down_index][@right_index]
  end

  def tree?
    position == '#'
  end

  def not_tree?
    !is_tree?
  end
end

landscape_data = File.read('input.txt').split(/\s/)
landscape = Landscape.new(landscape_data)

tree_count = 0
while true
  landscape.move(3, 1)
  break if landscape.done?
  begin
    if landscape.tree?
      tree_count += 1 
    end
  rescue
    break
  end
end
puts "tree count: #{tree_count}"