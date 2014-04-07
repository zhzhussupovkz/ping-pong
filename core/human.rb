=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Human - main player (human) class
class Human < Player

  def initialize window
    super window, 30, 220, "images/r-left.png"
  end

  #main movement
  def move
    up if window.button_down? Gosu::KbUp
    down if window.button_down? Gosu::KbDown
  end

end