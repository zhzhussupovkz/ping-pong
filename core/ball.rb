=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Ball - ping-pong ball
class Ball

  def initialize window, x, y
    @window, @x, @y = window, x, y
    @img = Gosu::Image.new window, 'images/ball.png', true
  end

  #draw ball
  def draw
    @img.draw(@x, @y, 2)
  end
  
end