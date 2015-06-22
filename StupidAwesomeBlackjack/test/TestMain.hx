package ;

class TestMain  {

	static function main()
	{
		var runner = new haxe.unit.TestRunner();
		runner.add(new ValuatorTest());
		runner.run();
	}	
}