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

  def get key
    request "GET #{key}"
  end

  def set key, value
    request "SET #{key} #{value}"
  end
  
  def close
    request "CLOSE"
  end

  def request data
    @client = TCPSocket.new host, port
    @client.write(string)
    @client.close_write
    @client.read
  end
end