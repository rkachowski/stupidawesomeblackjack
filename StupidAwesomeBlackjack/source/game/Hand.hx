package game;

import game.Card;

class Hand {
	var _cards:Array<Card>;

	public function new()
	{
		_cards = new Array<Card>();
	}

	public function addCard(card:Card)
	{
		_cards.push(card);
	}

	public function getCards():Array<Card>
	{
		return _cards.copy();
	}
}