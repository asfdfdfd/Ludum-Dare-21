package com.asfdfdfd.games.ld21
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Dialog extends Entity
	{				
		public function Dialog(graphic:Graphic=null, mask:Mask=null)
		{
			super(0, 352, graphic, mask);
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.C))
			{
				world.remove(this);
			}
		}
	}
}