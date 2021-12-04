package com.asfdfdfd.games.ld21.world.title
{
	import com.asfdfdfd.games.ld21.world.world01.World01;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	
	public class WorldTitle extends World
	{
		public function WorldTitle()
		{
			var title:Title = new Title();
			add(title);
		}
		
		override public function update():void
		{
			if (Input.mousePressed)
			{
				FP.world = new World01;
			}
			
			super.update();
		}
	}
}