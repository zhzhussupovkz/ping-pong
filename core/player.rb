=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Player - main player (human or AI) class
class Player

  def initialize window, x, y, img
    @window, @x, @y = window, x, y
    @img = Gosu::Image.new window, img, false
  end

  attr_accessor :x, :y
  attr_reader :window

  #draw
  def draw
    @img.draw(@x, @y, 2)
  end

  #move up
  def up
    @y -= 5.0 if @y >= 30
  end

  #move down
  def down
    @y += 5.0 if @y <= 415
  end

end