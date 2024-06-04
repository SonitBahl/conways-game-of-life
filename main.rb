require 'ruby2d'

set background: 'white'

SQUARE_SIZE = 40
set width: SQUARE_SIZE * 16
set height: SQUARE_SIZE * 12

class Grid
  def initialize
    @grid = {}
    @line_color = 'black'
    @square_color = 'black'
    @playing = false
  end

  def clear
    @grid = {}
    @playing = false
  end

  def play_pause
    @playing = !@playing
  end

  def draw_lines
    (Window.width / SQUARE_SIZE).times do |x|
      Line.new(
        width: 1,
        color: @line_color,
        y1: 0,
        y2: Window.height,
        x1: x * SQUARE_SIZE,
        x2: x * SQUARE_SIZE,
      )
    end

    (Window.height / SQUARE_SIZE).times do |y|
      Line.new(
        width: 1,
        color: @line_color,
        x1: 0,
        x2: Window.width,
        y1: y * SQUARE_SIZE,
        y2: y * SQUARE_SIZE,
      )
    end
  end

  def toggle(x, y)
    if @grid.has_key?([x, y])
      @grid.delete([x, y])
    else
      @grid[[x, y]] = true
    end
  end

  def draw_alive_squares
    @grid.keys.each do |x, y|
      Square.new(
        color: @square_color,
        x: x * SQUARE_SIZE,
        y: y * SQUARE_SIZE,
        size: SQUARE_SIZE
      )
    end
  end

  def advance_frame
    return unless @playing

    new_grid = {}

    (Window.width / SQUARE_SIZE).times do |x|
      (Window.height / SQUARE_SIZE).times do |y|
        alive = @grid.has_key?([x, y])

        alive_neighbours = [
          @grid.has_key?([x-1, y-1]), # Top Left
          @grid.has_key?([x  , y-1]), # Top
          @grid.has_key?([x+1, y-1]), # Top Right
          @grid.has_key?([x+1, y  ]), # Right
          @grid.has_key?([x+1, y+1]), # Bottom Right
          @grid.has_key?([x  , y+1]), # Bottom
          @grid.has_key?([x-1, y+1]), # Bottom left
          @grid.has_key?([x-1, y  ]), # Left
        ].count(true)

        if (alive && alive_neighbours.between?(2,3)) || (!alive && alive_neighbours == 3)
          new_grid[[x, y]] = true
        end
      end
    end

    @grid = new_grid
  end

  def draw_paused_message
    if !@playing
      Text.new(
        'Game is paused',
        x: Window.width / 2 - 40,
        y: Window.height / 2 - 30,
        size: 40,
        color: 'black'
      )
    end
  end
end

grid = Grid.new

update do
  clear
  grid.draw_lines
  grid.draw_alive_squares
  grid.draw_paused_message

  if Window.frames % 20 == 0
    grid.advance_frame
  end
end

on :mouse_down do |event|
  grid.toggle(event.x / SQUARE_SIZE, event.y / SQUARE_SIZE)
end

on :key_down do |event|
  grid.play_pause if event.key == 'p'
  if event.key == 'c'
    grid.clear
  end
end

show
