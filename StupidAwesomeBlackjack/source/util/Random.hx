package util;

class Random {
	//fisher-yates shuffle (in place)
	@:generic public static function shuffle<T>(array:Array<T>)
	{
		for(i in (array.length-1)...0)
		{
			var j = Math.round(Math.random() * i);
			var temp = array[i];
			array[i] = array[j];
			array[j] = temp;
		}
	}
}