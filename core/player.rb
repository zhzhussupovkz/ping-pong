=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Player - main player (human) class
class Player

  def initialize window, position, is_me = false
    @window, @position, @is_me = window, position, is_me
    case @position
    when 'left'
      @img = Gosu::Image.new window, "images/r-left.png", false
      @x, @y = 30, 220
    when 'right'
      @img = Gosu::Image.new window, "images/r-right.png", false
      @x, @y = 600, 220
    end
    @score, @speed = 0, 5
    @client = PingPongClient.new 'localhost', 4001
  end

  attr_accessor :x, :y, :score, :speed
  attr_reader :window, :is_me

  #draw
  def draw
    @img.draw(@x, @y, 2)
  end

  #move up
  def up
    @y -= @speed if @y >= 30
    @client.set @position, @y
  end

  #move down
  def down
    @y += @speed if @y <= 415
    @client.set @position, @y
  end

  #add score
  def add_score
    @score += 1
  end

  #main movement
  def move
    if is_me
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

  #close connection with ping pong server
  def close_connection
    @client.close
  end
  

end
