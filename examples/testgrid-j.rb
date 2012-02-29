#!/usr/bin/env ruby

require "newt"

menuContents = ["一", "二", "三", "四", "五"]
autoEntries = ["エントリ", "別のエントリ", 
  "三番目のエントリ", "四番目のエントリ",]

begin
  Newt::Screen.new

  b1 = Newt::Checkbox.new(-1, -1, "テストのためのかなり長いチェックボックス", ' ', nil)
  b2 = Newt::Button.new(-1, -1, "別のボタン")
  b3 = Newt::Button.new(-1, -1, "しかし、しかし")
  b4 = Newt::Button.new(-1, -1, "しかし何だろう？")

  f = Newt::Form.new

  grid = Newt::Grid.new(2, 2)
  grid.set_field(0, 0, Newt::GRID_COMPONENT, b1, 0, 0, 0, 0,
				Newt::ANCHOR_RIGHT, 0)
  grid.set_field(0, 1, Newt::GRID_COMPONENT, b2, 0, 0, 0, 0, 0, 0)
  grid.set_field(1, 0, Newt::GRID_COMPONENT, b3, 0, 0, 0, 0, 0, 0)
  grid.set_field(1, 1, Newt::GRID_COMPONENT, b4, 0, 0, 0, 0, 0, 0)

  f.add(b1, b2, b3, b4)

  grid.wrapped_window("一番目のウィンドウ")

  answer = f.run()

  #f.destroy()
  Newt::Screen.pop_window()

  flowedText, textWidth, textHeight = Newt.reflow_text("これはかなりテキストらしいものです。40カラム" +
													 "の長さで、ラッピングが行われます。" +
													 "素早い、茶色の狐がのろまな犬を飛び" +
													 "越えたのを知ってるかい?\n\n" +
													 "他にお知らせすることとして、適当に改行をする" +
													 "ことが重要です。",
													 40, 5, 5)
  t = Newt::Textbox.new(-1, -1, textWidth, textHeight, Newt::FLAG_WRAP)
  t.set_text(flowedText)

  b1 = Newt::Button.new(-1, -1, "了解")
  b2 = Newt::Button.new(-1, -1, "キャンセル")

  grid = Newt::Grid.new(1, 2)
  subgrid = Newt::Grid.new(2, 1)

  subgrid.set_field(0, 0, Newt::GRID_COMPONENT, b1, 0, 0, 0, 0, 0, 0)
  subgrid.set_field(1, 0, Newt::GRID_COMPONENT, b2, 0, 0, 0, 0, 0, 0)

  grid.set_field(0, 0, Newt::GRID_COMPONENT, t, 0, 0, 0, 1, 0, 0)
  grid.set_field(0, 1, Newt::GRID_SUBGRID, subgrid, 0, 0, 0, 0, 0,
				Newt::GRID_FLAG_GROWX)
  grid.wrapped_window("別の例")

  f = Newt::Form.new
  f.add(b1, t, b2)
  #f.add(b1, b2)
  answer = f.run()

  Newt::Screen.pop_window()
  #f.destroy()

  Newt::Screen.win_message("シンプル", "了解", "これはシンプルなメッセージウィンドウです")
  Newt::Screen.win_choice("シンプル", "了解", "キャンセル", "これはシンプルな選択ウィンドウです")

  textWidth = Newt::Screen.win_menu("テストメニュー", "これは newtWinMenu() コールのサンプル" +
									"です。 スクロールバーは必要に応じてついたり、 " +
									"つかなかったりします。", 50, 5, 5, 3,
									menuContents, "了解", "キャンセル")

  v = Newt::Screen.win_entries("テキスト newtWinEntries()", "これは newtWinEntries()" +
							   "コールのサンプルです。たいへん簡単にたくさんの入力を" +
							   "扱うことができます。", 50, 5, 5, 20, autoEntries, "了解", "キャンセル")

ensure
  Newt::Screen.finish

  printf "item = %d\n", textWidth
  p v
end
