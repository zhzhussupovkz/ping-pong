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
    @angle, @speed = 275, 2
    @client = PingPongClient.new 'localhost', 4001
  end

  attr_accessor :x, :y
  attr_reader :window, :speed

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
    left = window.world.get_left_player
    if x <=  53.0 && y < left.y + 40 && y > left.y
      case direction
      when 'second'
        @angle += (720 - 2 * angle)
      when 'third'
        @angle -= (2 * angle - 360)
      end
    end 
  end

  #play by right player
  def play_game_by_right
    right = window.world.get_right_player
    if x >=  592 && y < right.y + 40 && y > right.y
      case direction
      when 'first'
        @angle -= 2 * angle
      when 'fourth'
        @angle += (360 - 2 * angle)
      end
    end 
  end

  #turn by direction when ricoshet
  def turn_by_direction
    case direction
    when 'first'
      if @x >= 612
        @angle -= 2 * angle
        left = window.world.get_left_player
        left.add_score
        reboot
      elsif @y <= 31
        @angle += (180 - 2 * angle)
      end
    when 'second'
      if @x <= 32
        @angle += (720 - 2 * angle)
        right = window.world.get_right_player
        right.add_score
        reboot
      elsif @y <= 31
        @angle -= (2 * angle - 540)
      end
    when 'third'
      if @x <= 32
        @angle -= (2 * angle - 360)
        right = window.world.get_right_player
        right.add_score
        reboot
      elsif @y >= 454
        @angle += (540 - 2 * angle)
      end
    when 'fourth'
      if @x >= 612
        @angle += (360 - 2 * angle)
        left = window.world.get_left_player
        left.add_score
        reboot
      elsif @y >= 454
        @angle -= (2 * angle - 180)
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
    @x += speed * Math.sin(Math::PI * angle / 180) if @x <= 612
    @y -= speed * Math.cos(Math::PI * angle / 180) if @y >= 30
  end

  #movement in the second quadrant
  def move_second
    @x -= speed * Math.sin(2 * Math::PI - Math::PI * angle / 180) if @x >= 32
    @y -= speed * Math.cos(2 * Math::PI - Math::PI * angle / 180) if @y >= 30
  end

  #movement in the third quadrant
  def move_third
    @x -= speed * Math.sin(Math::PI * angle / 180 - Math::PI) if @x >= 32
    @y += speed * Math.cos(Math::PI * angle / 180 - Math::PI) if @y <= 454
  end

  #movement in the fourth quadrant
  def move_fourth
    @x -= speed * Math.sin(Math::PI * angle / 180 - Math::PI) if @x <= 612
    @y += speed * Math.cos(Math::PI * angle / 180 - Math::PI) if @y <= 454
  end

  #reboot ball, after add scores to players
  def reboot
    new_angle = (@client.reboot_ball).to_f
    @x, @y, @angle = 320, 240, new_angle
    window.world.me.reboot
    window.world.you.reboot
  end

end
