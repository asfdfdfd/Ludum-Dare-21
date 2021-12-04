package com.asfdfdfd.games.ld21.world.world02
{
	import com.asfdfdfd.games.ld21.Assets;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	
	public class Door02 extends Entity
	{
		public var _opened:Boolean = true;
		
		public function Door02(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			name = "Door02";
			type = "Door";
			
			graphic = new Image(Assets.IMAGE_DOOR);
			
			setHitbox(32, 32);
									
			super(x, y, graphic, mask);
		}
		
		public function open():void
		{
			_opened = true;
		}
		
		public function get opened():Boolean
		{
			return _opened;
		}
	}
}