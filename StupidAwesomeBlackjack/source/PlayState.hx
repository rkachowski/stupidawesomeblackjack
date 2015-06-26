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
	var _nextButton:FlxButton;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		_shoe = new Shoe(4);

		setupUI();
		newRound();
	}

	function setupUI()
	{
		_playerScore = new FlxText(20,200,300,"WWWWWWWWWWWWWWWWWW");
		_dealerScore = new FlxText(20,20,300,"WWWWWWWWWWWWWWWWWW");
		_hitButton = new FlxButton(350,200,"Hit",onHit);
		_standButton = new FlxButton(350,220,"Stand",onStand);
		_nextButton = new FlxButton(350,240,"Next Round",onNext);
		_nextButton.active = false;

		add(_playerScore);
		add(_dealerScore);
		add(_hitButton);
		add(_standButton);
		add(_nextButton);
	}
	
	function newRound()
	{
		_round = new Round(_shoe);
		_nextButton.active = false;
		updateScores();
	}

	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	function onHit()
	{
		_round.addPlayerCard();
		updateScores();
	}

	function onStand()
	{
		_round.dealerTurn();
		updateScores();
		_nextButton.active = true;
	}

	function onNext()
	{
		newRound();
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
	}	
}