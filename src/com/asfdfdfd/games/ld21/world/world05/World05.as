package com.asfdfdfd.games.ld21.world.world05
{
	
	import com.asfdfdfd.games.ld21.Assets;
	import com.asfdfdfd.games.ld21.Dialog;
	import com.asfdfdfd.games.ld21.Man;
	import com.asfdfdfd.games.ld21.Options;
	import com.asfdfdfd.games.ld21.world.escaped.WorldEscaped;
	import com.asfdfdfd.games.ld21.world.world04.World04;
	import com.asfdfdfd.games.ld21.world.world06.World06;
	import com.asfdfdfd.games.ld21.world.world09.World09;
	
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class World05 extends World
	{
		private var _sfxSwitch:Sfx = new Sfx(Assets.SWITCHER_OPEN);
		
		public function World05(manX:Number = 1 * 32, manY:Number = 10 * 32, from6:Boolean = false)
		{
			var room:Room05 = new Room05();
			add(room);			
			
			if (!from6)
			{
				var lift:Lift = new Lift(3 * 32, 10 * 32);
				add(lift);
						
				var switcher:Switcher = new Switcher(5 * 32, 9 * 32);
				add(switcher);
			}
			else
			{
				var lift:Lift = new Lift(3 * 32, 3 * 32);
				add(lift);
				lift.moveDown();
				
				var switcher:Switcher = new Switcher(5 * 32, 9 * 32);
				add(switcher);				
			}
			
			if (!Options.BOB_RELEASED)
			{
				var door01:AutoDoor = new AutoDoor(19 * 32, 9 * 32);
				add(door01);
			}
						
			var man:Man = new Man(manX, manY);
			add(man);		
			
			if (!Options.BOB_DIALOG_03_SHOWED)
			{
				var dialog:Dialog = new Dialog(new Image(Assets.IMAGE_BOB_DIALOG_03));
				add(dialog);
				
				Options.BOB_DIALOG_03_SHOWED = true;
			}				
		}
		
		override public function update():void
		{
			var man:Man = getInstance("Man");
			var lift:Lift = getInstance("Lift");
			
			if (man.x < 32)
			{
				FP.world = new World04(18 * 32);
			}
			
			if (man.y < 0)
			{
				FP.world = new World06();
			}		
			
			if (man.x > 608)
			{
				FP.world = new WorldEscaped;
			}					
						
			if (Input.pressed("ManUp"))
			{
				if (man.collide("Switcher", man.x, man.y))
				{			
					var lift:Lift = getInstance("Lift");
					lift.moveUp();
					
					(getInstance("Switcher") as Switcher).graphic = new Image(Assets.IMAGE_SWITCHER_OPENED);
					_sfxSwitch.play();
				}			
			}	
						
						
			super.update();
		}			
	}
}