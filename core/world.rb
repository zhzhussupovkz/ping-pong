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
    @wall = Wall.new window
    @ball = Ball.new window, 320, 240
    @human = Human.new window
    @comp = Computer.new window
  end

  def draw
    @bg.draw(0,0,0)
    @wall.draw
    @ball.draw
    @human.draw
    @comp.draw
  end

  def update
    @human.move
  end

end