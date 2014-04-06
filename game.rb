#!/usr/bin/env ruby
# encoding: utf-8
require "gosu"
require "singleton"

require_relative "game_window"

GameWindow.instance.show
