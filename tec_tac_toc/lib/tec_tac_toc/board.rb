module TecTacToc
  class Board
    attr_reader :grid
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end
  def get_cell(x,y)
    grid[y][x]
  end
  def set_value(x, y, value)
    get_cell(x,y).value = value
  end
  def formatted_grid
    grid.each do |row|
      puts row.map {|cell| cell.value.empty? ? "_" : cell.value}.join" "
    end
  end
  def game_over
    return :winner if winner?
    return :draw if draw?
    false
  end

  private

  def draw?
    grid.flatten.map {|cell| cell.value}.none_empty?
  end
  def winner?
    winning_position.each do |winning_position|
      next if winning_position_values(winning_position).all_empty?
      return true if winning_position_values(winning_position).all_same?
    end
    false
  end
  def winning_position_values(winning_position)
    winning_position.map {|x| x.value}
  end
  def winning_position
    grid + grid.transpose + diagonals
  end
  def diagonals
    [
      [get_cell(0,0), get_cell(1,1), get_cell(2,2)],
      [get_cell(0,2), get_cell(1,1), get_cell(2,0)]
    ]
  end
  def default_grid
    Array.new(3) {Array.new(3) {Cell.new}}
  end
end
end
