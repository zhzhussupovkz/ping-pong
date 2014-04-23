=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#PingPongClient - ping pong client class
require "socket"

class PingPongClient

  def initialize host, port
    @host, @port = host, port
  end
  
  attr_reader :host, :port

  #set player's coordinate
  def set position, value
    begin
      socket = TCPSocket.new host, port
      socket.write "SET #{position} #{value}"
      socket.close_write
      socket.close
    rescue Errno::ECONNRESET => e
      socket.close
    end
  end

  #get player's coordinate
  def get position
    begin
      socket = TCPSocket.new host, port
      socket.write "GET #{position}"
      socket.close_write
      return socket.read
      socket.close
    rescue Errno::ECONNRESET => e
      socket.close
    end
  end

  #reboot ball coordinates
  def reboot_ball
    begin
      socket = TCPSocket.new host, port
      socket.write "REBOOT"
      socket.close_write
      return socket.read
      socket.close
    rescue Errno::ECONNRESET => e
      socket.close
    end
  end

  #close connection with server
  def close
    begin
      socket = TCPSocket.new host, port
      socket.write "CLOSE"
      socket.close_write
      socket.close
    rescue Errno::ECONNRESET => e
      socket.close
    end
  end

end
