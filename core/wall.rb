=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Wall - wall class
class Wall

  def initialize window
    @window = window
    @block = Gosu::Image.new window, 'images/wall.png', true
  end

  #draw blocks
  def draw
    (0..640).step(20) do |i|
      @block.draw(i, 0, 1)
    end
    (20..480).step(20) do |i|
      @block.draw(0, i, 1)
      @block.draw(620, i, 1)
    end
    (20..640).step(20) do |i|
      @block.draw(i, 460, 1)
    end
  end
  
end