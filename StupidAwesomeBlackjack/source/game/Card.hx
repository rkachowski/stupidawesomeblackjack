package game;

enum Suite{
	Hearts;
	Spades;
	Clubs;
	Diamonds;
	None;
}

enum Face {
	ACE;
	TWO;
	THREE;
	FOUR;
	FIVE;
	SIX;
	SEVEN;
	EIGHT;
	NINE;
	TEN;
	JACK;
	QUEEN;
	KING;
	None;
}

class Card {
	var _suite = Suite.None;
	var _face = Face.None;

	public function new(suite : Suite, face : Face)
	{
		_suite = suite;
	}
}