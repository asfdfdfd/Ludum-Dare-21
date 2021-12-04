package com.asfdfdfd.games.ld21
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	
	public class Wall extends Entity
	{
		public function Wall(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			type = "Wall";
			
			graphic = new Image(Assets.IMAGE_WALL);
			
			setHitbox(Options.WALL_HEIGHT, Options.WALL_WIDTH);
			
			super(x, y, graphic, mask);
		}
	}
}