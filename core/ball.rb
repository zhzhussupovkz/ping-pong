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
    @angle, @speed = -80, 10
  end

  attr_accessor :x, :y
  attr_reader :window

  #draw ball
  def draw
    @img.draw_rot x, y, 2, angle
  end

  #calculate angle
  def angle
    @angle % 360
  end

  #move
  def move_by_direction
    case direction
    when 'first'
      move_first
    when 'second'
      move_second
    when 'third'
      move_third
    when 'fourth'
      move_fourth
    end
  end

  #play by left player
  def play_game_by_left
    if x <=  53.0 && y < window.world.left.y + 40 && y > window.world.left.y
      case direction
      when 'second'
        @angle += 90
      when 'third'
        @angle -= 90
      end
    end 
  end

  #play by right player
  def play_game_by_right
    if x >=  592 && y < window.world.right.y + 40 && y > window.world.right.y
      case direction
      when 'first'
        @angle -= 90
      when 'fourth'
        @angle += 90
      end
    end 
  end

  #turn by direction when ricoshet
  def turn_by_direction
    case direction
    when 'first'
      if @x >= 612
        @angle -= 90
        window.world.left.add_score
        reboot
      elsif @y <= 31
        @angle += 90
      end
    when 'second'
      if @x <= 32
        @angle += 90
        window.world.right.add_score
        reboot
      elsif @y <= 31
        @angle -= 90
      end
    when 'third'
      if @x <= 32
        @angle -= 90
        window.world.right.add_score
        reboot
      elsif @y >= 454
        @angle += 90
      end
    when 'fourth'
      if @x >= 612
        @angle += 90
        window.world.left.add_score
        reboot
      elsif @y >= 454
        @angle -= 90
      end
    end
  end

  #ball direction
  def direction
    if angle.between?(0, 90)
      'first'
    elsif angle.between?(270, 360)
      'second'
    elsif angle.between?(180, 270)
      'third'
    elsif angle.between?(90, 180)
      'fourth'
    end
  end

  #movement in the first quadrant
  def move_first
    @x += 2 * Math.sin(Math::PI * angle / 180) if @x <= 612
    @y -= 2 * Math.cos(Math::PI * angle / 180) if @y >= 30
  end

  #movement in the second quadrant
  def move_second
    @x -= 2 * Math.sin(2*Math::PI - Math::PI * angle / 180) if @x >= 32
    @y -= 2 * Math.cos(2*Math::PI - Math::PI * angle / 180) if @y >= 30
  end

  #movement in the third quadrant
  def move_third
    @x -= 2 * Math.sin(Math::PI * angle / 180 - Math::PI) if @x >= 32
    @y += 2 * Math.cos(Math::PI * angle / 180 - Math::PI) if @y <= 454
  end

  #movement in the fourth quadrant
  def move_fourth
    @x -= 2 * Math.sin(Math::PI * angle / 180 - Math::PI) if @x <= 612
    @y += 2 * Math.cos(Math::PI * angle / 180 - Math::PI) if @y <= 454
  end

  #reboot ball, after add scores to players
  def reboot
    @x, @y, @angle = 320, 240, [-80,80].sample
    window.world.left.reboot
    window.world.right.reboot
  end

end
