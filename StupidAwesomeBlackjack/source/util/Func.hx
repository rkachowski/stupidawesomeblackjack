package util;

using Lambda;

class Func {
	public static function sumi(array:Array<Int>):Int
	{
		return Lambda.fold(array, function(v1, v2){ return v1+v2;}, 0);
	}
}