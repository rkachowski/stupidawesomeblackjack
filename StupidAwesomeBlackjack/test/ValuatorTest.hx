package;
import game.Card;
import game.Card.Pip;
import game.Card.Suite.Clubs;
import game.Hand;
import game.rules.Valuator;

import haxe.unit.TestCase ;

class ValuatorTest extends TestCase {
	var testHand:Hand = new Hand();

	override public function setup()
	{
		testHand = new Hand();
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

	public function testSoftify()
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

	public function testGetSoftness()
	{
		testHand.addCard(new Card(Clubs,Pip.ACE));
		assertEquals(11, Valuator.calculateValue(testHand));
		assertEquals(Softness.SOFT, Valuator.calculateHandSoftness(testHand));

		testHand.addCard(new Card(Clubs,Pip.FIVE));
		assertEquals(16, Valuator.calculateValue(testHand));
		assertEquals(Softness.SOFT, Valuator.calculateHandSoftness(testHand));

		testHand.addCard(new Card(Clubs,Pip.FIVE));
		assertEquals(21, Valuator.calculateValue(testHand));
		assertEquals(Softness.SOFT, Valuator.calculateHandSoftness(testHand));

		testHand.addCard(new Card(Clubs,Pip.FIVE));
		assertEquals(16, Valuator.calculateValue(testHand));
		assertEquals(Softness.HARD, Valuator.calculateHandSoftness(testHand));

		testHand.addCard(new Card(Clubs,Pip.ACE));
		assertEquals(17, Valuator.calculateValue(testHand));
		assertEquals(Softness.HARD, Valuator.calculateHandSoftness(testHand));

		testHand.addCard(new Card(Clubs,Pip.ACE));
		assertEquals(18, Valuator.calculateValue(testHand));
		assertEquals(Softness.HARD, Valuator.calculateHandSoftness(testHand));
	}

	public function testBust()
	{
		testHand.addCard(new Card(Clubs,Pip.ACE));
		assertEquals(false, Valuator.isBust(testHand));
		testHand.addCard(new Card(Clubs,Pip.JACK));
		assertEquals(false, Valuator.isBust(testHand));
		testHand.addCard(new Card(Clubs,Pip.JACK));
		assertEquals(false, Valuator.isBust(testHand));
		testHand.addCard(new Card(Clubs,Pip.ACE));
		assertEquals(true, Valuator.isBust(testHand));

		testHand = new Hand();
		testHand.addCard(new Card(Clubs,Pip.ACE));
		testHand.addCard(new Card(Clubs,Pip.ACE));
		testHand.addCard(new Card(Clubs,Pip.ACE));
		testHand.addCard(new Card(Clubs,Pip.ACE));
		testHand.addCard(new Card(Clubs,Pip.ACE));
		testHand.addCard(new Card(Clubs,Pip.ACE));
		assertEquals(false, Valuator.isBust(testHand));
		testHand.addCard(new Card(Clubs,Pip.KING));
		assertEquals(false, Valuator.isBust(testHand));
		testHand.addCard(new Card(Clubs,Pip.TEN));
		assertEquals(true, Valuator.isBust(testHand));
	}

	public function testBlackjackDetection()
	{
		testHand.addCard(new Card(Clubs,Pip.ACE));
		testHand.addCard(new Card(Clubs,Pip.JACK));
		assertEquals(true, Valuator.isNaturalBlackjack(testHand));
		testHand.addCard(new Card(Clubs,Pip.TWO));
		assertEquals(false, Valuator.isNaturalBlackjack(testHand));

		testHand = new Hand();
		testHand.addCard(new Card(Clubs,Pip.JACK));
		testHand.addCard(new Card(Clubs,Pip.EIGHT));
		testHand.addCard(new Card(Clubs,Pip.THREE));
		assertEquals(false, Valuator.isNaturalBlackjack(testHand));
	}
}