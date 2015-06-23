package game.structure;

import game.Shoe;
import game.structure.Player;
import game.rules.Valuator;

class Round {

	var _player:Player;
	var _dealer:Dealer;
	var _shoe:Shoe;

	public function new(?player:Player, ?dealer:Dealer, ?shoe:Shoe)
	{
		if(player == null) _player = new Player() else _player = player;
		if(dealer == null) _dealer = new Dealer() else _dealer = dealer;
		if(shoe == null) _shoe = new Shoe(4) else _shoe = shoe;

		deal();
	}

	public function deal()
	{
		//TODO: take bets

		_player.addCard(_shoe.takeCard());
		_player.addCard(_shoe.takeCard());

		_dealer.addCard(_shoe.takeCard());

		trace("player - " + Valuator.calculateValue(_player.getHand()));
		trace("dealer - " + Valuator.calculateValue(_dealer.getHand()));
	}
}