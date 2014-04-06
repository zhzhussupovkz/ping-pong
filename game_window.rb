class GameWindow < Gosu::Window

  include Singleton

  def initialize
    super 640, 480, false
    self.caption = 'Ping pong'
    @bg = Gosu::Image.new self, "images/bg.png", true
  end

  #draw
  def draw
    @bg.draw(0,0,0)
  end

  #update
  def update
    
  end

  #button down event
  def button_down(key)
    case key
    when Gosu::KbEscape
      close
    end
  end
  
end