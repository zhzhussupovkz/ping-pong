#!/usr/bin/env ruby
# encoding: utf-8
=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#PingPongServer - main server class
require "socket"

class PingPongServer

  def initialize port
    @server = TCPServer.new port
    puts "Listening on port #{@server.local_address.ip_port}"

    #player's coordinates
    @storage = {}
  end

  #start server
  def start
    Socket.accept_loop(@server) do |conn|
      listen conn
      conn.close
    end
  end

  def listen conn
    request = conn.read
    process request
  end

  def process request
    command, key, value = request.split
    case command.upcase
    when 'GET'
      #get player's coordinates
      @storage[key]
    when 'SET'
      #set player's coordinates
      @storage[key] = value
    when 'CLOSE'
      'Good bye!'
      exit
    end
  end
end

server = PingPongServer.new 4001
server.start