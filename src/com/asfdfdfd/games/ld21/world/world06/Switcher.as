package com.asfdfdfd.games.ld21.world.world06
{
	import com.asfdfdfd.games.ld21.Assets;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	
	public class Switcher extends Entity
	{
		public function Switcher(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			name = "Switcher";
			type = "Switcher";
			
			graphic = new Image(Assets.IMAGE_SWITCHER);
			
			setHitbox(32, 32);
			
			super(x, y, graphic, mask);
		}
	}
}