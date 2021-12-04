package com.asfdfdfd.games.ld21
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	
	public class Kit extends Entity
	{
		private var _sfxKit:Sfx = new Sfx(Assets.KIT_PICKUP);
		
		public function Kit(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			graphic = new Image(Assets.IMAGE_KIT);
			
			name = "Kit";
			type = "Kit";
			
			setHitbox(32, 32);
			
			super(x, y, graphic, mask);
		}
		
		override public function update():void
		{
			if (collide("Man", x, y))
			{
				_sfxKit.play();
				
				if (!Options.BOB_DIALOG_09_SHOWED)
				{
					var dialog:Dialog = new Dialog(new Image(Assets.IMAGE_BOB_DIALOG_09));
					dialog.x = 0;
					dialog.y = 0;
					world.add(dialog);
					
					Options.BOB_DIALOG_09_SHOWED = true;
					
					Options.HAVE_KIT = true;
				}	
				
				world.remove(this);				
			}
		}
	}
}