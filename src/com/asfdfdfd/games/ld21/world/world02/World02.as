package com.asfdfdfd.games.ld21.world.world02
{
	
	import com.asfdfdfd.games.ld21.Assets;
	import com.asfdfdfd.games.ld21.Dialog;
	import com.asfdfdfd.games.ld21.Man;
	import com.asfdfdfd.games.ld21.Options;
	import com.asfdfdfd.games.ld21.world.game_over.WorldGameOver;
	import com.asfdfdfd.games.ld21.world.world01.World01;
	import com.asfdfdfd.games.ld21.world.world03.World03;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class World02 extends World
	{
		public function World02(manX:Number = 4 * 32, manY:Number = 10 * 32)
		{
			var room:Room02 = new Room02();
			add(room);			
			
			var door02:Door02 = new Door02(3 * 32, 10 * 32);
			add(door02);
	
			var man:Man = new Man(manX, manY);
			add(man);
			
			if (!Options.BOB_DIALOG_05_SHOWED)
			{
				var dialog:Dialog = new Dialog(new Image(Assets.IMAGE_BOB_DIALOG_05));
				dialog.x = 0;
				dialog.y = 0;
				add(dialog);
				
				Options.BOB_DIALOG_05_SHOWED = true;
			}				
		}
		
		override public function update():void
		{
			var man:Man = getInstance("Man");
			
			if (man.y > 13 * 32)
			{
				FP.world = new WorldGameOver();
			}			
			
			if (Input.pressed("ManUp"))
			{
				if (man.collide("Door", man.x, man.y))
				{					
					var door02:Door02 = getInstance("Door02") as Door02;
					if (door02.opened)
					{
						FP.world = new World01(14 * 32);
					}
				}				
			}
			
			if (man.x > 608)
			{
				FP.world = new World03();
			}
			
			super.update();
		}
	}
}