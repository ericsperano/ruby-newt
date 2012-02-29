#!/usr/bin/env ruby

require "newt"

Newt::Screen.new

checktree = Newt::CheckboxTreeMulti.new(-1, -1, 10, " ab", Newt::FLAG_SCROLL)
checktree.add("ナンバー", 2, 0, Newt::ARG_APPEND)
checktree.add("本当に本当に長いモノ", 3, 0, Newt::ARG_APPEND)
checktree.add("ナンバー５", 5, Newt::FLAG_SELECTED, Newt::ARG_APPEND)
checktree.add("ナンバー６", 6, 0, Newt::ARG_APPEND)
checktree.add("ナンバー７", 7, Newt::FLAG_SELECTED, Newt::ARG_APPEND)
checktree.add("ナンバー８", 8, 0, Newt::ARG_APPEND)
checktree.add("ナンバー９", 9, 0, Newt::ARG_APPEND)
checktree.add("ナンバー１０", 10, Newt::FLAG_SELECTED, Newt::ARG_APPEND)
checktree.add("ナンバー１１", 11, 0, Newt::ARG_APPEND)
checktree.add("ナンバー１２", 12, Newt::FLAG_SELECTED, Newt::ARG_APPEND)

checktree.add("カラー", 1, 0, 0)
checktree.add("赤色", 100, 0, 0, Newt::ARG_APPEND)
checktree.add("白色", 101, 0, 0, Newt::ARG_APPEND)
checktree.add("青色", 102, 0, 0, Newt::ARG_APPEND)

checktree.add("ナンバー４", 4, 0, 3)

checktree.add("一桁の数字", 200, 0, 1, Newt::ARG_APPEND)
checktree.add("一", 201, 0, 1, 0, Newt::ARG_APPEND)
checktree.add("二", 202, 0, 1, 0, Newt::ARG_APPEND)
checktree.add("三", 203, 0, 1, 0, Newt::ARG_APPEND)
checktree.add("四", 204, 0, 1, 0, Newt::ARG_APPEND)

checktree.add("二桁の数字", 300, 0, 1, Newt::ARG_APPEND)
checktree.add("十", 210, 0, 1, 1, Newt::ARG_APPEND)
checktree.add("十一", 211, 0, 1, 1, Newt::ARG_APPEND)
checktree.add("十二", 212, 0, 1, 1, Newt::ARG_APPEND)
checktree.add("十三", 213, 0, 1, 1, Newt::ARG_APPEND)

button = Newt::Button.new(-1, -1, "終了")

grid = Newt::Grid.new(1, 2)
grid.set_field(0, 0, Newt::GRID_COMPONENT, checktree, 0, 0, 0, 1,
			  Newt::ANCHOR_RIGHT, 0)
grid.set_field(0, 1, Newt::GRID_COMPONENT, button, 0, 0, 0, 0,
			  0, 0)

grid.wrapped_window("チェックボックスツリーテスト")

form = Newt::Form.new
form.add(checktree, button)

answer = form.run()

Newt::Screen.finish

