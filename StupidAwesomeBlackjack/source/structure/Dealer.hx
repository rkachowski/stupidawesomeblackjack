package structure;

import game.Hand;
import game.rules.Valuator;

class Dealer 
{
	public static function shouldHit(hand:Hand):Bool
	{
		var value = Valuator.calculateValue(hand);
		var soft = Valuator.calculateHandSoftness(hand);

		//todo: replace with config rules (soft 17)
		if (value < 17) return true;
		
		return false;
	}
}