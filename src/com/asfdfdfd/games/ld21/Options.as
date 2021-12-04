package com.asfdfdfd.games.ld21
{
	import flash.utils.Dictionary;

	public class Options
	{
		public static const SCREEN_WIDTH:int = 640;
		public static const SCREEN_HEIGHT:int = 480;
		
		public static var WORLD:String = "";
		
		public static const GRAVITY_ACCELERATION:int = 40; 
		
		public static const MAN_SPEED:int = 200;
		public static const MAN_JUMP_SPEED:int = -700;
		public static const MAN_WIDTH:int = 32;
		public static const MAN_HEIGHT:int = 32;
		public static const MAN_HEALTH:int = 100;

		public static const BOSS_BULLET_HITBOX_WIDTH:Number = 32;
		public static const BOSS_BULLET_HITBOX_HEIGHT:Number = 32;
		public static const BOSS_BULLET_SPEED:Number = 600;
		public static const BOSS_BULLET_DAMAGE:Number = 1;		
		
		public static const MAN_BULLET_HITBOX_WIDTH:Number = 4;
		public static const MAN_BULLET_HITBOX_HEIGHT:Number = 4;
		public static const MAN_BULLET_SPEED:Number = 400;
		public static const MAN_BULLET_DAMAGE:Number = 10;
		
		public static const WOMAN_SPEED:int = 200;
		public static const WOMAN_WIDTH:int = 32;
		public static const WOMAN_HEIGHT:int = 32;	
		
		public static const WALL_WIDTH:int = 32;
		public static const WALL_HEIGHT:int = 32;	
		
		public static const BOSS_01_WIDTH:int = 32 * 3;
		public static const BOSS_01_HEIGHT:int = 32 * 3;
		public static const BOSS_01_SPEED:int = 500;
		public static const BOSS_01_DELAY:int = 3000;
		public static const BOSS_01_HEALTH:int = 500;
		
		public static const BOB_SPEED:Number = 500;
		public static const BOB_HEALTH:Number = 500;
		
		public static const ENEMY_01_HEALTH:int = 10;
		public static const ENEMY_01_DAMAGE:int = 20;
		
		public static const ENEMY_02_HEALTH:int = 20;
		public static const ENEMY_02_DAMAGE:int = 20;
		public static const ENEMY_02_SPEED:int = 100;
		public static const ENEMY_02_DELAY:int = 200;
		
		public static const LIFT_SPEED:Number = 600;
		public static const AUTODOOR_SPEED:Number = 600;
		
		public static var BOB_DIALOG_01_SHOWED:Boolean = false;
		public static var BOB_DIALOG_02_SHOWED:Boolean = false;
		public static var BOB_DIALOG_03_SHOWED:Boolean = false;
		public static var BOB_DIALOG_04_SHOWED:Boolean = false;
		public static var BOB_DIALOG_05_SHOWED:Boolean = false;
		public static var BOB_DIALOG_06_SHOWED:Boolean = false;
		public static var BOB_DIALOG_07_SHOWED:Boolean = false;
		public static var BOB_DIALOG_08_SHOWED:Boolean = false;
		public static var BOB_DIALOG_09_SHOWED:Boolean = false;
		public static var BOB_DIALOG_10_SHOWED:Boolean = false;
		public static var BOB_DIALOG_11_SHOWED:Boolean = false;
		public static var BOB_DIALOG_12_SHOWED:Boolean = false;
		public static var BOB_DIALOG_13_SHOWED:Boolean = false;
		
		public static var BOSS01_KILLED:Boolean = false;
		public static var HAVE_KIT:Boolean = false;
		public static var BOB_RELEASED:Boolean = false;
		
		public static var ENEMY1_KILLED:Boolean = false;
		public static var ENEMY2_KILLED:Boolean = false;
		public static var ENEMY3_KILLED:Boolean = false;
	}
}