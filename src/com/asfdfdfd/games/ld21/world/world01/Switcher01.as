package com.asfdfdfd.games.ld21.world.world01
{
	import com.asfdfdfd.games.ld21.Assets;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	
	public class Switcher01 extends Entity
	{
		public function Switcher01(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			name = "Switcher01";
			type = "Switcher";
			
			graphic = new Image(Assets.IMAGE_SWITCHER);
			
			setHitbox(32, 32);
			
			super(x, y, graphic, mask);
		}
	}
}