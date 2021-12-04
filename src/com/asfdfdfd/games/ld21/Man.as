package com.asfdfdfd.games.ld21
{
	import com.asfdfdfd.games.ld21.world.game_over.WorldGameOver;
	import com.asfdfdfd.games.ld21.world.world01.Door01;
	import com.asfdfdfd.games.ld21.world.world02.World02;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Man extends Entity
	{
		private var _health:Number = Options.MAN_HEALTH;
		private var _jumpsCount = 0;
		private var _gravityAcceleration:Number = 0;
		
		private var _verticalSpeed:Number = 0;
		private var _horizontalSpeed:Number = 0;
		
		private var _directionX:int = 0;
		
		private var _sfxShoot:Sfx = new Sfx(Assets.MAN_SHOOT);
		private var _sfxHurt:Sfx = new Sfx(Assets.MAN_HURT);
		
		public function Man(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			name = "Man";
			type = "Man";
			
			graphic = new Image(Assets.IMAGE_MAN);
			
			Input.define("ManUp", Key.UP);
			Input.define("ManDown", Key.DOWN);
			Input.define("ManLeft", Key.LEFT);
			Input.define("ManRight", Key.RIGHT);
			Input.define("ManShoot", Key.Z);
			
			setHitbox(Options.MAN_HEIGHT, Options.MAN_WIDTH);
			
			_gravityAcceleration = Options.GRAVITY_ACCELERATION;
						
			super(x, y, graphic, mask);
		}
		
		
		private function checkCollisionsWithRoomDown():void
		{
			if (_verticalSpeed > 0)
			{
				var room:Entity = collide("Room", x, y + _verticalSpeed);
				
				if (room)
				{
					_verticalSpeed = 0;
					
					_jumpsCount = 0;
				}
			}
			
			var lift:Entity = collide("Lift", x, y + _verticalSpeed);
			
			if (lift)
			{
				_verticalSpeed = 0;
				y = lift.y - 32;
				
				_jumpsCount = 0;
			}		
		}
		
		private function checkCollisionsWithRoomUp():void
		{
			if (_verticalSpeed < 0)
			{
				var entity:Entity = collide("Room", x, y + _verticalSpeed);
				
				if (entity)
				{
					_verticalSpeed = 0;
				}
			}
		}
		
		private function checkCollisionsWithRoomLeftRight():void
		{
			if (_horizontalSpeed)
			{
				var entity:Entity = collide("Room", x + _horizontalSpeed, y);
				
				if (entity)
				{
					_horizontalSpeed = 0;
				}
				
				var entity:Entity = collide("AutoDoor", x + _horizontalSpeed, y);
				
				if (entity)
				{
					_horizontalSpeed = 0;
				}				
			}
		}		
		
		private function jump():void
		{
			_verticalSpeed = Options.MAN_JUMP_SPEED * FP.elapsed;
		}
		
		public function get health():Number
		{
			return _health;
		}
		
		private function shoot():void
		{
			_sfxShoot.play();
			
			var xpos = x;
			if (_directionX == 1)
				xpos += 32;
			
			var bullet:ManBullet = new ManBullet(xpos, y, _directionX);
			world.add(bullet);
		}
		
		public function hit(damage:Number):void
		{
			_health -= damage;
			_sfxHurt.play();
			
			if (_health <= 0)
			{
				FP.world = new WorldGameOver;
			}
		}
		
		override public function update():void
		{
			if (Input.pressed("ManShoot"))
			{
				shoot();
			}
			
			_verticalSpeed += Options.GRAVITY_ACCELERATION * FP.elapsed;
			
			checkCollisionsWithRoomDown();
			checkCollisionsWithRoomUp();
			checkCollisionsWithRoomLeftRight();
				
			y += _verticalSpeed;
			x += _horizontalSpeed;
			
			var canJump:Boolean = true;
			
			if (collide("BossBullet", x, y))
			{
				hit(Options.BOSS_BULLET_DAMAGE);
			}
			
			canJump = collide("Switcher", x, y) == null;
			if (canJump)
				canJump = collide("Door", x, y) == null;
			
			if (_verticalSpeed == 0)
				_jumpsCount = 0;
			
			if (Input.pressed("ManUp") && canJump && _jumpsCount < 2)
			{
				if (!_verticalSpeed || _jumpsCount == 1)
				{
					_jumpsCount++;
					jump();
				}
			}
			
			if (Input.check("ManUp"))
			{
				//_verticalSpeed -= Options.MAN_JUMP_DECCELERATION * FP.elapsed;				
			}
			
			if (Input.released("ManUp"))
			{
				_verticalSpeed = 0;
			}
	
			if (Input.check("ManLeft"))
			{
				_horizontalSpeed = -Options.MAN_SPEED * FP.elapsed;
				_directionX = 0;
			}
			
			if (Input.released("ManLeft"))
			{
				_horizontalSpeed = 0;
			}
			
			if (Input.check("ManRight"))
			{
				_horizontalSpeed = Options.MAN_SPEED * FP.elapsed;
				_directionX = 1;
			}
			
			if (Input.released("ManRight"))
			{
				_horizontalSpeed = 0;
			}			
		}
	}
}