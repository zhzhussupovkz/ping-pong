=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#World - main game logic
class World

  def initialize window
    @window = window
    @bg = Gosu::Image.new window, "images/bg.png", true
    @ui = Gosu::Font.new(window, 'Monospace', 20)
    @wall = Wall.new window
    @ball = Ball.new window, 320, 240
    @human = Human.new window
    @comp = Computer.new window
  end

  attr_reader :human, :comp, :ball

  def draw
    @bg.draw(0,0,0)
    @wall.draw
    @ball.draw
    @human.draw
    @comp.draw
    @ui.draw("#{human.score} : #{comp.score}", 300, 5, 4)
    year = (Time.at(Time.now.to_i)).strftime("%Y")
    @ui.draw("Copyright (c) #{year} by zhzhussupovkz", 175, 462, 4)
  end

  def update
    @human.move
    play_game
  end

  #main game logic
  def play_game
    ball.move_by_direction
    ball.turn_by_direction
    ball.play_game_by_human
  end

end
