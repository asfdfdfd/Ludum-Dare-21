package com.asfdfdfd.games.ld21
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	
	public class ManBullet extends Entity
	{
		private var _directionX:int = 0;
		
		public function ManBullet(x:Number, y:Number, directionX:int, graphic:Graphic=null, mask:Mask=null)
		{
			name = "ManBullet";
			type = "ManBullet";
			
			_directionX = directionX;
			
			graphic = new Image(Assets.IMAGE_MAN_BULLET);
			
			setHitbox(Options.MAN_BULLET_HITBOX_WIDTH, Options.MAN_BULLET_HITBOX_HEIGHT);
			
			super(x, y, graphic, mask);
		}
		
		override public function update():void
		{
			if (_directionX == 0)
			{
				x -= Options.MAN_BULLET_SPEED * FP.elapsed;
			}	
			
			if (_directionX == 1)
			{
				x += Options.MAN_BULLET_SPEED * FP.elapsed;
			}
		}
	}
}