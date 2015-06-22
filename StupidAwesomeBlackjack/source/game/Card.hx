package game;

enum Suite{
	Hearts;
	Spades;
	Clubs;
	Diamonds;
}

enum Pip {
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
}

class Card {
	public var suite:Suite;
	public var pip:Pip;

	public function new(suite : Suite, pip : Pip)
	{
		this.suite = suite;
		this.pip = pip;
	}
}