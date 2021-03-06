=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#GameWindow - main window class
class GameWindow < Gosu::Window

  include Singleton

  def initialize
    super 640, 480, false
    self.caption = 'Ping pong'
    @world = World.new self, true
  end

  attr_reader :world

  #draw
  def draw
    @world.draw
  end

  #update
  def update
    @world.update
  end

  #button down event
  def button_down(key)
    case key
    when Gosu::KbEscape
      world.close_connections
      close
    end
  end
  
end
