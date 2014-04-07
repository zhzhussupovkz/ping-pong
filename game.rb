#!/usr/bin/env ruby
# encoding: utf-8
require "gosu"
require "singleton"

require_relative "core/world"
require_relative "core/wall"
require_relative "core/ball"
require_relative "core/player"
require_relative "core/human"
require_relative "core/computer"
require_relative "game_window"

GameWindow.instance.show
