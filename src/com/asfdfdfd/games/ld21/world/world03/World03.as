package com.asfdfdfd.games.ld21.world.world03
{
	
	import com.asfdfdfd.games.ld21.Assets;
	import com.asfdfdfd.games.ld21.Dialog;
	import com.asfdfdfd.games.ld21.Enemy01;
	import com.asfdfdfd.games.ld21.Man;
	import com.asfdfdfd.games.ld21.Options;
	import com.asfdfdfd.games.ld21.world.game_over.WorldGameOver;
	import com.asfdfdfd.games.ld21.world.world02.World02;
	import com.asfdfdfd.games.ld21.world.world04.World04;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	public class World03 extends World
	{
		public function World03(manX:Number = 1 * 32, manY:Number = 10 * 32)
		{
			var room:Room03 = new Room03();
			add(room);			
	
			var man:Man = new Man(manX, manY);
			add(man);	
						
			if (!Options.BOB_DIALOG_06_SHOWED)
			{
				var dialog:Dialog = new Dialog(new Image(Assets.IMAGE_BOB_DIALOG_06));
				dialog.x = 0;
				dialog.y = 0;
				add(dialog);
				
				Options.BOB_DIALOG_06_SHOWED = true;
			}				
		}
		
		override public function update():void
		{
			var man:Man = getInstance("Man");
			
			if (man.y > 13 * 32)
			{
				FP.world = new WorldGameOver();
			}				
						
			if (man.x < 32)
			{
				FP.world = new World02(18 * 32);
			}
			
			if (man.x >= 608)
			{
				FP.world = new World04();
			}
			
			super.update();
		}		
	}
}