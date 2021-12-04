package com.asfdfdfd.games.ld21.world.world08
{
	import com.asfdfdfd.games.ld21.Assets;
	import com.asfdfdfd.games.ld21.Man;
	import com.asfdfdfd.games.ld21.Options;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.motion.LinearMotion;
	
	public class AutoDoor extends Entity
	{
		private var _locked:Boolean = true;
		private var _motion:LinearMotion = new LinearMotion();
		
		public function AutoDoor(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			name = "AutoDoor";
			type = "AutoDoor";
			
			graphic = new Image(Assets.IMAGE_AUTODOOR);
			
			setHitbox(32, 32 * 2);
			
			addTween(_motion);			
			
			super(x, y, graphic, mask);
		}
		
		public function open():void
		{
			_motion.setMotionSpeed(x, y, 0 * 32, 7 * 32, Options.AUTODOOR_SPEED);
		}
		
		public function close():void
		{
			_motion.setMotionSpeed(x, y, 0 * 32, 9 * 32, Options.AUTODOOR_SPEED);
		}
		
		public function unlock():void
		{
			_locked = false;
		}
		
		override public function update():void
		{
			if (_motion.active)
			{
				x = _motion.x;
				y = _motion.y;
			}		
			
			if (!_locked)
			{
				var man:Man = world.getInstance("Man");
				if (man.x - x <= 100)
				{
					open();
				}
			}
		}
	}
}