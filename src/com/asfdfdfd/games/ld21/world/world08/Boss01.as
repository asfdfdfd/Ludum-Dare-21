package com.asfdfdfd.games.ld21.world.world08
{
	import com.asfdfdfd.games.ld21.Assets;
	import com.asfdfdfd.games.ld21.BossBullet;
	import com.asfdfdfd.games.ld21.Kit;
	import com.asfdfdfd.games.ld21.Man;
	import com.asfdfdfd.games.ld21.ManBullet;
	import com.asfdfdfd.games.ld21.Options;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.motion.LinearMotion;
	
	public class Boss01 extends Entity
	{
		private var _canShoot:Boolean = false;
		
		private var _health:Number = Options.BOSS_01_HEALTH;
		
		private var _state:int = 2;
		
		private var _motion:LinearMotion = new LinearMotion();
		
		private var timer1:Timer = new Timer(Options.BOSS_01_DELAY, 1);
		private var timer2:Timer = new Timer(Options.BOSS_01_DELAY, 1);
		
		private var _sfxShoot:Sfx = new Sfx(Assets.BOSS_SHOOT);
		private var _sfxDeath:Sfx = new Sfx(Assets.BOSS_DEATH);
		private var _sfxHurt:Sfx = new Sfx(Assets.ENEMY_HURT);
		
		public function Boss01(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			name = "Boss01";
			type = "Boss";
			
			graphic = new Image(Assets.IMAGE_BOSS01);
						
			setHitbox(Options.BOSS_01_WIDTH, Options.BOSS_01_HEIGHT);
			
			addTween(_motion);
						
			super(x, y, graphic, mask);
		}
		
		private function checkCollisionWithManBullet():void
		{
			var bullet:ManBullet = collide("ManBullet", x, y) as ManBullet;
			
			if (bullet)
			{			
				_sfxHurt.play();
				_health -= Options.MAN_BULLET_DAMAGE;
				world.remove(bullet);
			}					
			
			if (_health < 0)
			{
				Options.BOSS01_KILLED = true;
				
				var kit:Kit = new Kit(x, y);
				world.add(kit);
				
				world.remove(this);
				
				_sfxDeath.play();
				
				var door:AutoDoor = world.getInstance("AutoDoor") as AutoDoor;
				door.unlock();
			}
		}
		
		private function shoot():void
		{
			_sfxShoot.play();
				
			var bullet:BossBullet = new BossBullet;
			world.add(bullet);
			
			if (_state == 2)
				bullet.motion.setMotionSpeed(x, y + 60, -100, y + 60, Options.BOSS_BULLET_SPEED);
			
			if (_state == 5)
				bullet.motion.setMotionSpeed(x, y + 60, 700, y + 60, Options.BOSS_BULLET_SPEED);			
		}
		
		override public function update():void
		{
			checkCollisionWithManBullet();
			
			var man:Man = collide("Man", x, y) as Man;
			
			if (man)
			{
				man.hit(1);
			}			
			
			if (!_canShoot && (_health <= Options.BOSS_01_HEALTH / 2))
			{
				_canShoot = true;
			}
			
			if (_motion.active)
			{
				x = _motion.x;
				y = _motion.y;
			}
			
			if (_state == 0)
			{
				_state = 1;
				_motion.setMotionSpeed(1 * 32, 8 * 32, 15 * 32, 8 * 32, Options.BOSS_01_SPEED);
				_motion.complete = function():void {
					_state = 2;
				}
			}
			
			if (_state == 2)
			{
				timer1.addEventListener(TimerEvent.TIMER_COMPLETE, function(e:TimerEvent):void {
					_state = 3;
				});
				timer1.start();
				
				if (_canShoot)
					shoot();
				
				_state = 666;
			}
			
			if (_state == 3)
			{
				_state = 4;
				_motion.setMotionSpeed(15 * 32, 8 * 32, 1 * 32, 8 * 32, Options.BOSS_01_SPEED);
				_motion.complete = function():void {
					_state = 5;
				}				
			}
			
			if (_state == 5)
			{
				timer2.addEventListener(TimerEvent.TIMER_COMPLETE, function(e:TimerEvent):void {
					_state = 0;
				});
				timer2.start();
				
				if (_canShoot)
					shoot();	
				
				_state = 666;
			}			
		}
	}
}