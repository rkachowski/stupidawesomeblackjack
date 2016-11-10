test:
	cd StupidAwesomeBlackjack/test/; haxe test.hxml && neko TestMain.n

run:
	cd StupidAwesomeBlackjack; lime test neko
