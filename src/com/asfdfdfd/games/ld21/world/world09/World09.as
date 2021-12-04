package com.asfdfdfd.games.ld21.world.world09
{
	
	import com.asfdfdfd.games.ld21.Man;
	
	import net.flashpunk.World;
	
	public class World09 extends World
	{
		public function World09(manX:Number = 1 * 32, manY:Number = 10 * 32)
		{			
			var room:Room09 = new Room09();
			add(room);
			
			var door01:AutoDoor = new AutoDoor(0 * 32, 9 * 32);
			add(door01);			
					
			var man:Man = new Man(manX, manY);
			add(man);				
		}
	}
}