#!/usr/bin/env ruby

# X

require 'rubygems'
require "newt"

begin

  Newt::Screen.new

  l1 = Newt::Listbox.new(1, 1, 10, Newt::FLAG_SCROLL | Newt::FLAG_SELECTED)
  1.upto(20) do |i|
	l1.append("item #{i}", i)
  end
  l1.select("item 2", 2)

  b = Newt::Button.new(1, 12, "Exit")

  f = Newt::Form.new
  f.add(l1, b)

  f.run()

ensure
  Newt::Screen.finish
end
