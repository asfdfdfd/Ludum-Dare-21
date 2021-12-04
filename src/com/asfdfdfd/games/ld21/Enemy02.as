package com.asfdfdfd.games.ld21
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.motion.LinearMotion;
	
	public class Enemy02 extends Entity
	{
		private var _health:Number = Options.ENEMY_02_HEALTH;
		
		private var _killed:Boolean = false;
		
		private var _xStart:Number = 0;
		private var _yStart:Number = 0;
		
		private var _xStop:Number = 0;
		private var _yStop:Number = 0;		
		
		private var _motion:LinearMotion = new LinearMotion();
		
		private var _state:int = 0;
		
		private var _sfxDeath:Sfx = new Sfx(Assets.ENEMY_DEATH);
		private var _sfxHurt:Sfx = new Sfx(Assets.ENEMY_HURT);
		
		public function Enemy02(xStart:Number, yStart:Number, xStop:Number, yStop:Number, graphic:Graphic=null, mask:Mask=null)
		{
			_xStart = xStart;
			_yStart = yStart;
			
			_xStop = xStop;
			_yStop = yStop;
			
			graphic = new Image(Assets.IMAGE_ENEMY02);
			
			setHitbox(32, 32);
			
			addTween(_motion);			
			
			super(xStart, yStart, graphic, mask);
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
				_sfxHurt.play();
				world.remove(bullet);
			}					
			
			if (_health < 0)
			{
				world.remove(this);
				_sfxDeath.play();
				
				if (name == "Enemy2")
					Options.ENEMY2_KILLED = true;
				else
					Options.ENEMY3_KILLED = true;
			}
		}
		
		override public function update():void
		{
			checkCollisionWithManBullet();
			
			var man:Man = collide("Man", x, y) as Man;
			if (man != null)
			{
				man.hit(Options.ENEMY_02_DAMAGE);
				world.remove(this);
				
				if (name == "Enemy2")
					Options.ENEMY2_KILLED = true;
				else
					Options.ENEMY3_KILLED = true;				
			}			
			
			if (_motion.active)
			{
				x = _motion.x;
				y = _motion.y;
			}
			
			if (_state == 0)
			{
				_state = 1;
				_motion.setMotionSpeed(_xStart, _yStart, _xStop, _yStop, Options.ENEMY_02_SPEED);
				_motion.complete = function():void {
					_state = 2;
				}
			}
			
			if (_state == 2)
			{
				var timer1:Timer = new Timer(Options.ENEMY_02_DELAY, 1);
				timer1.addEventListener(TimerEvent.TIMER_COMPLETE, function(e:TimerEvent):void {
					_state = 3;
				});
				timer1.start();
			}
			
			if (_state == 3)
			{
				_state = 4;
				_motion.setMotionSpeed( _xStop, _yStop, _xStart, _yStart, Options.ENEMY_02_SPEED);
				_motion.complete = function():void {
					_state = 5;
				}				
			}
			
			if (_state == 5)
			{
				var timer2:Timer = new Timer(Options.ENEMY_02_DELAY, 1);
				timer2.addEventListener(TimerEvent.TIMER_COMPLETE, function(e:TimerEvent):void {
					_state = 0;
				});
				timer2.start();
			}			
		}		
	}
}