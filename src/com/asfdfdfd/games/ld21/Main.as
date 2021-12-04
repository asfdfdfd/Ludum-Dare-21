package com.asfdfdfd.games.ld21
{
	import com.asfdfdfd.games.ld21.world.title.WorldTitle;
	import com.asfdfdfd.games.ld21.world.world01.World01;
	import com.asfdfdfd.games.ld21.world.world02.World02;
	import com.asfdfdfd.games.ld21.world.world03.World03;
	import com.asfdfdfd.games.ld21.world.world04.World04;
	import com.asfdfdfd.games.ld21.world.world05.World05;
	import com.asfdfdfd.games.ld21.world.world06.World06;
	import com.asfdfdfd.games.ld21.world.world07.World07;
	import com.asfdfdfd.games.ld21.world.world08.World08;
	import com.asfdfdfd.games.ld21.world.world09.World09;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class Main extends Engine
	{
		public function Main()
		{
			super(640, 480, 60, false);
			
			FP.world = new WorldTitle();
		}
	}
}