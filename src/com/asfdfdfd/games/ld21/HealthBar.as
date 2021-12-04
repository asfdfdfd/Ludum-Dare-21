package com.asfdfdfd.games.ld21
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	public class HealthBar extends Entity
	{
		private var _health:Number = -9999;
		
		public function HealthBar(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{			
			super(x, y, graphic, mask);
		}
		
		override public function update():void
		{
			var man:Man = world.getInstance("Man");
			
			if (_health != man.health)
			{
				_health = man.health;
				
				graphic = new Text(_health.toString() + "%");
			}
		}
	}
}