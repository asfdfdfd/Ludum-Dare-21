package com.asfdfdfd.games.ld21.world.world06
{
	
	import com.asfdfdfd.games.ld21.Assets;
	import com.asfdfdfd.games.ld21.Dialog;
	import com.asfdfdfd.games.ld21.Enemy02;
	import com.asfdfdfd.games.ld21.Man;
	import com.asfdfdfd.games.ld21.Options;
	import com.asfdfdfd.games.ld21.world.game_over.WorldGameOver;
	import com.asfdfdfd.games.ld21.world.world05.World05;
	import com.asfdfdfd.games.ld21.world.world07.World07;
	
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class World06 extends World
	{
		private var _sfxSwitch:Sfx = new Sfx(Assets.SWITCHER_OPEN);
		
		public function World06(manX:Number = 5 * 32, manY:Number = 13 * 32)
		{
			var room:Room06 = new Room06();
			add(room);			
			
			var lift:Lift = new Lift(2 * 32, 14 * 32);
			add(lift);
			
			var switcher:Switcher = new Switcher(4 * 32, 13 * 32);
			add(switcher);
			
			if (!Options.ENEMY2_KILLED)
			{
				var enemy01:Enemy02 = new Enemy02(8 * 32, 7 * 32, 11 * 32, 7 * 32);
				enemy01.name = "Enemy2";
				add(enemy01);
			}
			
			if (!Options.ENEMY3_KILLED)
			{
				var enemy02:Enemy02 = new Enemy02(17 * 32, 6 * 32, 19 * 32, 6 * 32);
				enemy02.name = "Enemy3";
				add(enemy02);			
			}
						
			var man:Man = new Man(manX, manY);
			add(man);
			
			lift.moveUp();
		}
		
		override public function update():void
		{
			var man:Man = getInstance("Man");
			
			if (man.x > 12 * 32 && man.y > 13 * 32)
			{
				FP.world = new WorldGameOver();
			}
			
			if (man.x > 608)
			{
				FP.world = new World07();
			}
			
			if (man.y > 480)
			{
				FP.world = new World05(6 * 32, 2 * 32, true);
			}		
			
			if (Input.pressed("ManUp"))
			{
				if (man.collide("Switcher", man.x, man.y))
				{			
					(getInstance("Switcher") as Switcher).graphic = new Image(Assets.IMAGE_SWITCHER_OPENED);
					_sfxSwitch.play();
					
					var lift:Lift = getInstance("Lift");
					lift.moveDown();
				}			
			}	
			
			super.update();
		}			
	}
}