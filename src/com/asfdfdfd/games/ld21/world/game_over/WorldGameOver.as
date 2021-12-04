package com.asfdfdfd.games.ld21.world.game_over
{
	import com.asfdfdfd.games.ld21.world.world01.World01;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class WorldGameOver extends World
	{
		public function WorldGameOver()
		{
			var title:Title = new Title();
			add(title);			
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.X))
			{
				FP.world = new World01;
			}
			
			super.update();
		}		
	}
}