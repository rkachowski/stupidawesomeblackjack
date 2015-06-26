package game.structure;

import game.Hand;
import game.Shoe;
import game.rules.Valuator;
import structure.Dealer;

class Round
{
    var DEALER_HAND:Int = 0;

    var _hands:Array<Hand>;
    var _shoe:Shoe;

    public function new(?shoe:Shoe)
    {
        if (shoe == null) _shoe = new Shoe(4) else _shoe = shoe;
        _hands = new Array<Hand>();

        _hands.push(new Hand()); // dealer
        _hands.push(new Hand()); // player

        deal();
    }

    public function deal()
    {
        addPlayerCard();
        addPlayerCard();

        addDealerCard();
    }

    public function dealerTurn()
    {
    	if(Dealer.shouldHit(_hands[DEALER_HAND]))
    	{
    		addDealerCard();
    		dealerTurn();
    	}
    }

    public function addPlayerCard(?split_no:Int = 0)
    {
        _hands[1 + split_no].addCard(_shoe.takeCard());
    }

    function addDealerCard()
    {
        _hands[DEALER_HAND].addCard(_shoe.takeCard());
    }

    public function getRoundValue()
    {
        return _hands.map(function(h)
        {
            return {softness : Valuator.calculateHandSoftness(h), value:Valuator.calculateValue(h)};
        });
    }

    public function getHand(hand_number:Int):Hand
    {
        return _hands[hand_number];
    }

    public function isPlayerBust():Bool
    {
        for(hand in _hands.slice(DEALER_HAND + 1))
        {
            if(!Valuator.isBust(hand)) return false;
        }

        return true;
    }
}