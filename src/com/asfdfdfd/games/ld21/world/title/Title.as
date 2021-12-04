package com.asfdfdfd.games.ld21.world.title
{
	import com.asfdfdfd.games.ld21.Assets;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	
	public class Title extends Entity
	{
		public function Title(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			graphic = new Image(Assets.IMAGE_TITLE);
			
			super(x, y, graphic, mask);
		}
	}
}