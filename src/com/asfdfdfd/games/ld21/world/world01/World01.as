package com.asfdfdfd.games.ld21.world.world01
{
	
	import com.asfdfdfd.games.ld21.Assets;
	import com.asfdfdfd.games.ld21.Dialog;
	import com.asfdfdfd.games.ld21.Man;
	import com.asfdfdfd.games.ld21.Options;
	import com.asfdfdfd.games.ld21.world.world02.World02;
	
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class World01 extends World
	{
		private var _sfxSwitch:Sfx = new Sfx(Assets.SWITCHER_OPEN);
		
		public function World01(manX:Number = 300, manY:Number = 10 * 32)
		{
			var room:Room01 = new Room01();
			add(room);			
						
			var door01:Door01 = new Door01(15 * 32, 10 * 32);
			add(door01);
			
			var switcher01:Switcher01 = new Switcher01(3 * 32, 10 * 32);
			add(switcher01);

			var man:Man = new Man(manX, manY);
			add(man);	
			
			if (!Options.BOB_DIALOG_02_SHOWED)
			{
				var dialog:Dialog = new Dialog(new Image(Assets.IMAGE_BOB_DIALOG_02));
				add(dialog);
				
				Options.BOB_DIALOG_02_SHOWED = true;
			}
		}	
		
		override public function update():void
		{
			if (Input.pressed("ManUp"))
			{
				var man:Man = getInstance("Man");
				
				if (man.collide("Switcher", man.x, man.y))
				{					
					var door01:Door01 = getInstance("Door01") as Door01;
					door01.open();
					
					if (!Options.BOB_DIALOG_04_SHOWED)
					{
						var dialog:Dialog = new Dialog(new Image(Assets.IMAGE_BOB_DIALOG_04));
						add(dialog);
						
						Options.BOB_DIALOG_04_SHOWED = true;
					}		
					
					_sfxSwitch.play();
					(getInstance("Switcher01") as Switcher01).graphic = new Image(Assets.IMAGE_SWITCHER_OPENED);
				}
				
				if (man.collide("Door", man.x, man.y))
				{					
					var door01:Door01 = getInstance("Door01") as Door01;
					if (door01.opened)
					{
						FP.world = new World02();
					}
				}				
			}	
			
			super.update();
		}
	}
}