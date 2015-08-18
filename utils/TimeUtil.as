package com.flashkev.utils{
	public class TimeUtil{
		//////////// variables ////////////

		//////////// Constructor ////////////
		
		public function TimeUtil() {
		}

		//////////// Properties functions ////////////
		

		//////////// Public functions ////////////
		public static function formatTime( time:int ):String{
			return Math.floor(time/60)+":"+StringUtil.padString(Math.floor(time%60).toString(),2,"0");
		}
		
		//////////// Private functions ////////////
		
		
	}
}