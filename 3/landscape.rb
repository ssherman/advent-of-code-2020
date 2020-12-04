class Landscape
  attr_accessor :rows, :right_index, :down_index, :data
  def initialize(data)
    @data = data
    @rows = data.map { |r| r.chars * data.count }
    @rows.delete_if { |r| r.empty? }
    reset
  end

  def reset
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

  def count_trees(right, down)
    tree_count = 0
    while true
      self.move(right, down)
      break if self.done?
      begin
        if self.tree?
          tree_count += 1 
        end
      rescue
        break
      end
    end
    self.reset
    tree_count
  end
end