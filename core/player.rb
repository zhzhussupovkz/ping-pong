=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Player - main player (human) class
class Player

  def initialize window, position
    @window, @position = window, position
    case @position
    when 'left'
      @img = Gosu::Image.new window, "images/r-left.png", false
      @x, @y = 30, 220
    when 'right'
      @img = Gosu::Image.new window, "images/r-right.png", false
      @x, @y = 600, 220
    end
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

  #main movement
  def move
    case @position
    when 'left'
      up if window.button_down? Gosu::KbW
      down if window.button_down? Gosu::KbS
    when 'right'
      up if window.button_down? Gosu::KbUp
      down if window.button_down? Gosu::KbDown
    end
  end

  #reboot after add score
  def reboot
    case @position
    when 'left'
      @x, @y = 30, 220
    when 'right'
      @x, @y = 600, 220
    end
  end

end
