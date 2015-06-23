package game.rules;

import game.*;
import game.Card;
import util.Func.*;

using Lambda;

enum Softness{
	HARD;
	SOFT;
}

class Valuator {
	public static function calculateValue(hand:Hand):Int{
		var cardValues = hand.getCards().map(function(c:Card){
			return Valuator.getCardValue(c);
		});

		return sumi(softify(cardValues));
	}

	public static function calculateSoftness(values:Array<Int>):Softness
	{
		var hand = softify(values);

		return if (Lambda.has(hand, 11)) Softness.SOFT else Softness.HARD;
	}

	public static function calculateHandSoftness(hand:Hand):Softness
	{
		return calculateSoftness(hand.getCards().map(function(c:Card){
			return Valuator.getCardValue(c);
		}));
	}

	static function softify(values:Array<Int>):Array<Int>
	{
		if(Lambda.has(values, 11) && sumi(values) > 21)
		{
			var result = values.copy();
			result[result.indexOf(11)] = 1;
			return softify(result);
		}
		else
		{
			return values;
		}
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