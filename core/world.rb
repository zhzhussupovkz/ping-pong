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
  end

  def draw
    @bg.draw(0,0,0)
    @wall.draw
    @ball.draw
  end

  def update
  end

end