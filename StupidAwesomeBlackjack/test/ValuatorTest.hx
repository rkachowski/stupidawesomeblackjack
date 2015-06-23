package;
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
		testCards = new Array<Card>();
	}

	public function testBasic()
	{
		testHand.addCard(new Card(Clubs,Pip.TWO));
		testHand.addCard(new Card(Clubs,Pip.TWO));

		assertEquals(4, Valuator.calculateValue(testHand));
	}

	public function testMore()
	{
		assertEquals(0, Valuator.calculateValue(testHand));

		testHand.addCard(new Card(Clubs,Pip.KING));
		assertEquals(10, Valuator.calculateValue(testHand));

		testHand.addCard(new Card(Clubs,Pip.TWO));
		assertEquals(12, Valuator.calculateValue(testHand));

		testHand.addCard(new Card(Clubs,Pip.FIVE));
		assertEquals(17, Valuator.calculateValue(testHand));

		testHand.addCard(new Card(Clubs,Pip.TEN));
		assertEquals(27, Valuator.calculateValue(testHand));

		testHand.addCard(new Card(Clubs,Pip.JACK));
		assertEquals(37, Valuator.calculateValue(testHand));

		testHand.addCard(new Card(Clubs,Pip.QUEEN));
		assertEquals(47, Valuator.calculateValue(testHand));
	}

	public function testSoft()
	{
		testHand.addCard(new Card(Clubs,Pip.ACE));
		assertEquals(11, Valuator.calculateValue(testHand));
		testHand.addCard(new Card(Clubs,Pip.ACE));
		assertEquals(12, Valuator.calculateValue(testHand));


		testHand.addCard(new Card(Clubs,Pip.ACE));
		assertEquals(13, Valuator.calculateValue(testHand));
		testHand.addCard(new Card(Clubs,Pip.KING));
		assertEquals(13, Valuator.calculateValue(testHand));
		testHand.addCard(new Card(Clubs,Pip.ACE));
		assertEquals(14, Valuator.calculateValue(testHand));
	}
}