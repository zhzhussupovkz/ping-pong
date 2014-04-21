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

  def get ip
    request "GET #{ip}"
  end

  def set ip, value
    request "SET #{ip} #{value}"
  end
  
  def close
    request "CLOSE"
  end

  def request data
    @client = TCPSocket.new host, port
    @client.write(data)
    @client.close_write
    @client.read
  end
end
