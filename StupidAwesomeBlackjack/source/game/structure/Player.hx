package game.structure;

import game.Card;
import game.Hand;

class Player {
	var _hands:Array<Hand>;

	public function new()
	{
		this.reset();
	}
	
	public function reset()
	{
		_hands = new Array<Hand>();
	}

	public function addCard(card:Card, ?hand_number:Int = 0)
	{
		if(_hands.length == 0)
		{
			_hands.push(new Hand());
		}

		_hands[hand_number].addCard(card);
	}

	public function getHand(?hand_number:Int = 0):Hand
	{
		return _hands[hand_number];
	}
}

class Dealer extends Player {

}