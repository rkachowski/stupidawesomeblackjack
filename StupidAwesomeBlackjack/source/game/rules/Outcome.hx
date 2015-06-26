package game.rules;

import game.rules.Valuator;
import game.structure.Round;

enum Result {
    WIN;
    LOSE;
    BLACKJACK;
    PUSH;
    IN_PLAY;
}

class Outcome 
{
	public static function assessRound(round:Round):Result
	{
		var dealerHand = round.getDealerHand();
		var playerHand = round.getPlayerHand();

		return assessHands(playerHand, dealerHand);
	}

	public static function assessHands(playerHand:Hand, dealerHand:Hand):Result
	{
		if(Valuator.isBust(playerHand)) return LOSE;
		if(Valuator.isNaturalBlackjack(playerHand)) return BLACKJACK;
		if(Valuator.isBust(dealerHand) || Valuator.calculateValue(playerHand) > Valuator.calculateValue(dealerHand)) return WIN;
		if(Valuator.calculateValue(playerHand) < Valuator.calculateValue(dealerHand)) return LOSE;
		if(Valuator.calculateValue(playerHand) == Valuator.calculateValue(dealerHand)) return PUSH;
		return IN_PLAY;//shutup compiler
	}
}