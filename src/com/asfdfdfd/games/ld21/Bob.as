package com.asfdfdfd.games.ld21
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.motion.LinearMotion;
	
	public class Bob extends Entity
	{
		private var _motion:LinearMotion = new LinearMotion();
		private var _timer:Timer = new Timer(1000, 1);
		
		public function Bob(move:Boolean = true, x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			graphic = new Image(Assets.IMAGE_BOB);
			
			if (move)
			{
				addTween(_motion);
				
				_timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(e:TimerEvent):void {
					_motion.setMotionSpeed(x, y, 660, y, Options.BOB_SPEED);
				});
				_timer.start();
			}
			
			super(x, y, graphic, mask);
		}
		
		override public function update():void
		{
			if (_motion.active)
			{
				x = _motion.x;
				y = _motion.y;
			}
		}
	}
}