package game.rules;

import game.*;
import game.Card;

using Lambda;

class Valuator {
	public static function getValue(hand:Hand):Int{
		var values = hand.getCards().map(function(c:Card){
			return Valuator.getCardValue(c);
		});


		return Lambda.fold(values, function(v1, v2){ return v1+v2;}, 0);
	}

	public static function getCardValue(card:Card):Int
	{
		return switch (card.pip) {
			case ACE: 11;
			case TWO: 2;
			case THREE: 3;
			case FOUR: 4;
			case FIVE: 5;
			case SIX: 6;
			case SEVEN: 7;
			case EIGHT: 8;
			case NINE: 9;
			case TEN: 10;
			case JACK: 10;
			case QUEEN: 10;
			case KING: 10;
		}
	}
}