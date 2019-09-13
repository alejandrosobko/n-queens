class Queen
  attr_reader :x, :y

  def initialize(position)
    @x = position[/\D+/]
    @y = position[/\d+/].to_i
  end
end
