package com.asfdfdfd.games.ld21.world.world05
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
	
	public class Lift extends Entity
	{
		private var _motion:LinearMotion = new LinearMotion();
		
		public function Lift(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			name = "Lift";
			type = "Lift";
			
			graphic = new Image(Assets.IMAGE_LIFT);
			
			setHitbox(5 * 32, 32);
						
			addTween(_motion);			
			
			super(x, y, graphic, mask);
		}
		
		public function moveUp():void
		{
			_motion.setMotionSpeed(x, y, 3 * 32, -32, Options.LIFT_SPEED);
		}
		
		public function moveDown():void
		{
			_motion.setMotionSpeed(x, y, 3 * 32, 10 * 32, Options.LIFT_SPEED);
		}
		
		override public function update():void
		{
//			var man:Man = FP.world.getInstance("Man");
//			if (man.y < y)
//				moveDown();
			
			if (_motion.active)
			{
				x = _motion.x;
				y = _motion.y;
								
				var switcher:Switcher = FP.world.getInstance("Switcher");
				switcher.y = y - 32;
			}
		}
	}
}