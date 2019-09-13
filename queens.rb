class Queen
  attr_reader :x, :y

  def initialize(position)
    @x = position[/\D+/]
    @y = position[/\d+/].to_i
  end
end

def attacked_by?(abc, queen1, queen2)
  same_x = queen1.x == queen2.x
  same_y = queen1.y == queen2.y
  is_diagonal = abc.index(queen1.x) == (abc.index(queen2.x) - (queen1.y - queen2.y)*-1)

  same_x || same_y || is_diagonal
end

def in_collision?(abc, queen, queens)
  !queens.empty? && attacked_by?(abc, queen, queens.first)
end

def some_queen_in_collision?(abc, queens)
  return false if queens.empty?

  queen = queens.delete(queens.first)
  in_collision?(abc, queen, queens) || some_queen_in_collision?(abc, queens)
end

# Test
abc = ('A'..'Z').to_a
queens = 'A1, C3'.split(', ').map { |x| Queen.new(x) }
otro_test = 'A1, D4'.split(', ').map { |x| Queen.new(x) }

puts some_queen_in_collision?(abc, queens) # true
puts some_queen_in_collision?(abc, otro_test) # true
