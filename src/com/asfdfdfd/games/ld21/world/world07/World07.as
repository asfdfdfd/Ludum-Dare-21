package com.asfdfdfd.games.ld21.world.world07
{
	
	import com.asfdfdfd.games.ld21.Man;
	import com.asfdfdfd.games.ld21.world.game_over.WorldGameOver;
	import com.asfdfdfd.games.ld21.world.world06.World06;
	import com.asfdfdfd.games.ld21.world.world08.World08;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	public class World07 extends World
	{
		public function World07(manX:Number = 1 * 32, manY:Number = 6 * 32)
		{
			var room:Room07 = new Room07();
			add(room);			
			
			var door01:AutoDoor = new AutoDoor(19 * 32, 9 * 32);
			add(door01);

			var man:Man = new Man(manX, manY);
			add(man);			
		}
		
		public override function update():void
		{
			var man:Man = getInstance("Man");
			
			if (man.x > 0 * 32 && man.y > 13 * 32)
			{
				FP.world = new WorldGameOver();
			}
			
			if (man.x < 32)
			{
				FP.world = new World06(18 * 32, 6 * 32);
			}			
			
			if (man.x > 608)
			{
				FP.world = new World08();
			}
						
			super.update();
		}
	}
}