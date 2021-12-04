package com.asfdfdfd.games.ld21
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.motion.LinearMotion;
	
	public class BossBullet extends Entity
	{
		public var motion:LinearMotion = new LinearMotion;
		
		public function BossBullet(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			name = "BossBullet";
			type = "BossBullet";
			
			graphic = new Image(Assets.IMAGE_BOSS_BULLET);
			
			setHitbox(32, 32);
			
			addTween(motion);
			
			super(x, y, graphic, mask);
		}
		
		override public function update():void
		{
			if (motion.active)
			{
				x = motion.x;
				y = motion.y;
			}
			
			var man:Man = collide("Man", x, y) as Man;
			
			if (man)
			{
				man.hit(Options.BOSS_BULLET_DAMAGE);
			}
		}
	}
}