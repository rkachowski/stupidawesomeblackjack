package game;

import game.Card;
import game.Card.Pip;
import game.Card.Suite;
import util.Random.*;

class Shoe {
	var _cards:Array<Card> = new Array<Card>();
	var _no_of_decks:Int;

	public function new(no_of_decks:Int)
	{
		_no_of_decks = no_of_decks;

		for(i in 0..._no_of_decks)
		{
			_cards = _cards.concat(Deck.StandardDeck());
		}	

		shuffle(_cards);
	}

	public function takeCard():Card
	{
		var card = _cards.pop();

		//TODO: check if shoe should be changed	
		
		return card;
	}
}

class ContinuousShuffleShoe extends Shoe{
	override public function takeCard():Card
	{
		var card = _cards[0];
		shuffle(_cards);
		return card;
	}
}

class Deck
{
	public static function StandardDeck():Array<Card>
	{
		var cards:Array<Card> = new Array<Card>();

		for(suite in Type.allEnums(Suite))
		{
			for(value in Type.allEnums(Pip))
			{
				cards.push(new Card(suite, value));
			}
		}

		return cards;
	}
}