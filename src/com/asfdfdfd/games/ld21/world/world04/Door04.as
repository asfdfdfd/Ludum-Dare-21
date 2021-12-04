package com.asfdfdfd.games.ld21.world.world04
{
	import com.asfdfdfd.games.ld21.Assets;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	
	public class Door04 extends Entity
	{
		public var _opened:Boolean = false;
		
		public function Door04(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			name = "Door04";
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