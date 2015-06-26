package;

import game.rules.Outcome;
import game.Hand;
import game.Card;
import game.Card.Pip;
import game.Card.Suite.Clubs;

import haxe.unit.TestCase;

class OutcomeTest extends TestCase
{
	var testHand:Hand = new Hand();
	var testDealerHand:Hand = new Hand();
	
	override public function setup()
	{
		testHand = new Hand();
		testDealerHand = new Hand();
	}

	public function testOutcome()
	{
		testHand.addCard(new Card(Clubs,Pip.KING));
		testHand.addCard(new Card(Clubs,Pip.KING));
		testDealerHand.addCard(new Card(Clubs,Pip.KING));
		assertEquals(Outcome.assessHands(testHand, testDealerHand), Result.WIN);

		testDealerHand.addCard(new Card(Clubs,Pip.KING));
		assertEquals(Outcome.assessHands(testHand, testDealerHand), Result.PUSH);

		testDealerHand.addCard(new Card(Clubs,Pip.ACE));
		assertEquals(Outcome.assessHands(testHand, testDealerHand), Result.LOSE);

		testDealerHand.addCard(new Card(Clubs,Pip.ACE));
		assertEquals(Outcome.assessHands(testHand, testDealerHand), Result.WIN);
	}

	public function testBust()
	{
		testHand.addCard(new Card(Clubs,Pip.KING));
		testHand.addCard(new Card(Clubs,Pip.KING));
		testHand.addCard(new Card(Clubs,Pip.ACE));
		testDealerHand.addCard(new Card(Clubs,Pip.ACE));

		assertEquals(Outcome.assessHands(testHand, testDealerHand), Result.WIN);

		testHand.addCard(new Card(Clubs,Pip.ACE));
		assertEquals(Outcome.assessHands(testHand, testDealerHand), Result.LOSE);
	}
}