class BinarySpaceParition
  attr_accessor :size, :steps, :row_data, :column_data, :current_start, :current_end
  def initialize(size, data, lower_char, upper_char)
    @lower_char = lower_char
    @upper_char = upper_char
    @size = size
    @data = data
    puts @data.join
    @current_start = 0
    @current_end = @size
  end

  def execute
    answer = nil
    @data.each do |direction|
      size  = (@current_end - @current_start) / 2
      if direction == @lower_char
        @current_end = @current_end - size
      elsif direction == @upper_char
        @current_start = @current_start + size
      end
      answer = @current_start
    end
    answer
  end
end