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
    @score, @speed = 0, 5
  end

  attr_accessor :x, :y, :score, :speed
  attr_reader :window

  #draw
  def draw
    @img.draw(@x, @y, 2)
  end

  #move up
  def up
    @y -= @speed if @y >= 30
  end

  #move down
  def down
    @y += @speed if @y <= 415
  end

  #add score
  def add_score
    @score += 1
  end

end
