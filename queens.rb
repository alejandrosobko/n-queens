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

t1 = 'A1, C3'.split(', ').map { |x| Queen.new(x) }
t2 = 'A1, A2, A3, A4, A5, A6, A7, A8'.split(', ').map { |x| Queen.new(x) }
t3 = 'A1, H8, '.split(', ').map { |x| Queen.new(x) }

f1 = 'H1, B2, E3, C4, F5, D8'.split(', ').map { |x| Queen.new(x) }
f2 = 'A1, H6, E4, C5, B3, D7'.split(', ').map { |x| Queen.new(x) }
f3 = 'G4'.split(', ').map { |x| Queen.new(x) }

puts "expected true, result: #{some_queen_in_collision?(abc, t1)}"
puts "expected true, result: #{some_queen_in_collision?(abc, t2)}"
puts "expected true, result: #{some_queen_in_collision?(abc, t3)}"
puts "expected false, result: #{some_queen_in_collision?(abc, f1)}"
puts "expected false, result: #{some_queen_in_collision?(abc, f2)}"
puts "expected false, result: #{some_queen_in_collision?(abc, f3)}"
