import game.Card;
import game.Card.Pip;
import game.Card.Suite.Clubs;
import game.Hand;
import game.rules.Valuator;

import haxe.unit.TestCase ;

class ValuatorTest extends TestCase {
	var testHand:Hand = new Hand();
	var testCards:Array<Card>;

	override public function setup()
	{
		testHand = new Hand();
		testCards = new Array<Card>;
	}

	public function testBasic()
	{
		testHand.addCard(new Card(Clubs,Pip.TWO));
		testHand.addCard(new Card(Clubs,Pip.TWO));

		assertEquals(4, Valuator.getValue(testHand));
	}
}