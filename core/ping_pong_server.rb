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
    @server = TCPServer.open port
    puts "Listening on port #{@server.local_address.ip_port}"

    #player's coordinates
    @storage = {
      'left' => 220,
      'right' => 220
    }

    #ball's properties
    @ball = {
      'x' => 320,
      'y' => 240,
      'angle' => 75
    }
  end

  #start server
  def start
    loop do
      Thread.start(@server.accept) do |client|
        process client
      end
    end
  end

  #process data from client and send
  def process client
    data = client.read
    command, position, value = data.split
    case command.upcase
    when 'SET'
      puts "SET request from #{position} (#{client.local_address.ip_port})"
      @storage[position] = value
    when 'REBOOT'
      angle = [75, 275].sample
      client.write("#{angle}")
    when 'GET'
      puts "GET request from #{position} (#{client.local_address.ip_port})"
      client.write("#{@storage[position]}")
    when 'CLOSE'
      puts "CLOSE all connections"
      exit
    end
    client.close
  end
end

server = PingPongServer.new 4001
server.start