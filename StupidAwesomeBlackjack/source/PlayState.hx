package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

import game.Shoe;
import game.structure.Round;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var _shoe:Shoe;
	var _round:Round;

	var _playerScore:FlxText;
	var _dealerScore:FlxText;
	var _hitButton:FlxButton;
	var _standButton:FlxButton;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		_shoe = new Shoe(4);
		_round = new Round(_shoe);

		setupUI();
	}

	function setupUI()
	{
		_playerScore = new FlxText(20,200,300,"PLAYER SCOREWWWWWWW");
		_dealerScore = new FlxText(20,20,300,"DEALER SCOREWWWWWWW");

		updateScores();

		add(_playerScore);
		add(_dealerScore);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	function updateScores()
	{
		var value = _round.getRoundValue();

		_dealerScore.text = "Dealer - " + value[0].softness +" " + value[0].value + " " +_round.getHand(0);
		_playerScore.text = "Player - " + value[1].softness +" " + value[1].value + " " +_round.getHand(1);
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();

		if(FlxG.mouse.justReleased)
		{
			_round = new Round(_shoe);
			updateScores();
		}
	}	
}