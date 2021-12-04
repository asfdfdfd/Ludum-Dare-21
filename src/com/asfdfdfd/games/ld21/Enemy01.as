package com.asfdfdfd.games.ld21
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	
	public class Enemy01 extends Entity
	{
		private var _health:Number = 1;
		
		public var _killed:Boolean = false;
		
		private var _sfxDeath:Sfx = new Sfx(Assets.ENEMY_DEATH);
		
		public function Enemy01(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			name = "Enemy01";
			type = "Enemy";
			
			graphic = new Image(Assets.IMAGE_ENEMY01);
			
			setHitbox(32, 32);
			
			super(x, y, graphic, mask);
		}
		
		public function get killed():Boolean
		{
			return _killed;
		}
		
		private function checkCollisionWithManBullet():void
		{
			var bullet:ManBullet = collide("ManBullet", x, y) as ManBullet;
			
			if (bullet)
			{			
				_health -= Options.MAN_BULLET_DAMAGE;
				world.remove(bullet);
			}					
			
			if (_health < 0)
			{				
				_sfxDeath.play();
				world.remove(this);
				Options.ENEMY1_KILLED = true;
			}
		}
		
		override public function update():void
		{
			checkCollisionWithManBullet();
			var man:Man = collide("Man", x, y) as Man;
			if (man != null)
			{
				man.hit(Options.ENEMY_01_DAMAGE);
				world.remove(this);
				Options.ENEMY1_KILLED = true;
			}
		}
	}
}