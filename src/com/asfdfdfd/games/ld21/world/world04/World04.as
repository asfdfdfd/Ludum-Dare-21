package com.asfdfdfd.games.ld21.world.world04
{
	
	import com.asfdfdfd.games.ld21.Assets;
	import com.asfdfdfd.games.ld21.Bob;
	import com.asfdfdfd.games.ld21.Dialog;
	import com.asfdfdfd.games.ld21.Enemy01;
	import com.asfdfdfd.games.ld21.Man;
	import com.asfdfdfd.games.ld21.Options;
	import com.asfdfdfd.games.ld21.world.world03.World03;
	import com.asfdfdfd.games.ld21.world.world05.World05;
	
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class World04 extends World
	{
		public function World04(manX:Number = 1 * 32, manY:Number = 10 * 32)
		{
			var room:Room04 = new Room04();
			add(room);
			
			var door01:Door04 = new Door04(10 * 32, 10 * 32);
			add(door01);
			
			var switcher04:Switcher04 = new Switcher04(8 * 32, 10 * 32);
			add(switcher04);			
			
			if (!Options.ENEMY1_KILLED)
			{
				var enemy:Enemy01 = new Enemy01(500, 10 * 32);
				add(enemy);
			}
			
			var man:Man = new Man(manX, manY);
			add(man);		
			
			if (!Options.BOB_DIALOG_07_SHOWED)
			{
				var dialog:Dialog = new Dialog(new Image(Assets.IMAGE_BOB_DIALOG_07));
				dialog.x = 0;
				dialog.y = 0;
				add(dialog);
				
				Options.BOB_DIALOG_07_SHOWED = true;
			}			
		}
		
		private var _sfxSwitch:Sfx = new Sfx(Assets.SWITCHER_OPEN);
		
		override public function update():void
		{
			var man:Man = getInstance("Man");
	
			if (man.x < 32)
			{
				FP.world = new World03(18 * 32);
			}
			
			if (man.x > 608)
			{
				FP.world = new World05();
			}
			
			var enemy:Enemy01 = getInstance("Enemy01");
			if (!enemy)
			{
				if (!Options.BOB_DIALOG_08_SHOWED)
				{
					var dialog:Dialog = new Dialog(new Image(Assets.IMAGE_BOB_DIALOG_08));
					dialog.x = 0;
					dialog.y = 0;
					add(dialog);
					
					Options.BOB_DIALOG_08_SHOWED = true;
				}					
			}
			
			if (Input.pressed("ManUp"))
			{
				if (Options.HAVE_KIT && !Options.BOB_RELEASED)
				{
					var man:Man = getInstance("Man");
					
					if (man.collide("Switcher", man.x, man.y))
					{										
						Options.BOB_RELEASED = true;
						
						var bob:Bob = new Bob(true, 10*32, 10*32);
						add(bob);
						
						if (!Options.BOB_DIALOG_10_SHOWED)
						{
							var dialog:Dialog = new Dialog(new Image(Assets.IMAGE_BOB_DIALOG_10));
							add(dialog);
							
							Options.BOB_DIALOG_10_SHOWED = true;
						}		
						
						_sfxSwitch.play();
						(getInstance("Switcher04") as Switcher04).graphic = new Image(Assets.IMAGE_SWITCHER_OPENED);
					}
				}
			}	
			
			super.update();			
			
			super.update();
		}		
	}
}