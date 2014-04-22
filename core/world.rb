=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#World - main game logic
class World

  def initialize window, is_left
    @window, @is_left = window, is_left
    @bg = Gosu::Image.new window, "images/bg.png", true
    @ui = Gosu::Font.new(window, 'Monospace', 20)
    @wall = Wall.new window
    if is_left
      @me = Player.new window, 'left', true
      @you = Player.new window, 'right'
    else
      @me = Player.new window, 'right', true
      @you = Player.new window, 'left'
    end
    @ball = Ball.new window, 320, 240
  end

  attr_reader :me, :you, :ball, :is_left

  #draw world
  def draw
    @bg.draw(0,0,0)
    @wall.draw
    ball.draw
    me.draw
    you.draw
    @ui.draw("#{me.score} : #{you.score}", 300, 5, 4)
    year = (Time.at(Time.now.to_i)).strftime("%Y")
    @ui.draw("Copyright (c) #{year} by zhzhussupovkz", 175, 462, 4)
  end

  #update world
  def update
    me.move
    you.move
    play_game
  end

  #get left player
  def get_left_player
    if is_left
      me
    else
      you
    end
  end

  #get right player
  def get_right_player
    if is_left
      you
    else
      me
    end
  end

  #main game logic
  def play_game
    ball.move_by_direction
    ball.turn_by_direction
    ball.play_game_by_left
    ball.play_game_by_right
  end

  #close client connections
  def close_connections
    me.close_connection
    you.close_connection
  end

end
