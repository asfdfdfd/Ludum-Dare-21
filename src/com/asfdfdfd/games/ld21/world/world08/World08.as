package com.asfdfdfd.games.ld21.world.world08
{
	
	import com.asfdfdfd.games.ld21.Assets;
	import com.asfdfdfd.games.ld21.HealthBar;
	import com.asfdfdfd.games.ld21.Man;
	import com.asfdfdfd.games.ld21.Options;
	import com.asfdfdfd.games.ld21.world.world07.World07;
	import com.asfdfdfd.games.ld21.world.world08.Room08;
	import com.asfdfdfd.games.ld21.world.world09.World09;
	
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	
	public class World08 extends World
	{
		private var _sfxKit:Sfx = new Sfx(Assets.KIT_PICKUP);
		
		public function World08(manX:Number = 1 * 32, manY:Number = 10 * 32)
		{			
			var room:Room08 = new Room08();
			add(room);
			
			var door01:AutoDoor = new AutoDoor(0 * 32, 9 * 32);
			add(door01);			
					
			if (!Options.BOSS01_KILLED)
			{
				var boss01:Boss01 = new Boss01(15 * 32, 8 * 32);
				add(boss01);
			}
			else
			{
				door01.unlock();
			}
			
			var man:Man = new Man(manX, manY);
			add(man);	
		}
		
		override public function update():void
		{
			var man:Man = getInstance("Man");
			
			if (man.x < 32)
			{
				FP.world = new World07(18 * 32, 10 * 32);
			}	

			super.update();			
		}
	}
}