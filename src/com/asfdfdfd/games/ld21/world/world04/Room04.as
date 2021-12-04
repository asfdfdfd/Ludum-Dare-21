package com.asfdfdfd.games.ld21.world.world04
{
	import com.asfdfdfd.games.ld21.Assets;
	
	import flash.utils.ByteArray;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	public class Room04 extends Entity
	{
		private var _tilemap04:Tilemap = new Tilemap(Assets.IMAGE_TILESET, 640, 480, 32, 32);
		
		public function Room04(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{			
			type = "Room";
			
			graphic = _tilemap04;
			
			var levelData:String = (new Assets.MAP_ROOM04 as ByteArray).toString();
			_tilemap04.loadFromString(levelData);
			
			var grid:Grid = _tilemap04.createGrid([1]);
			mask = grid;
			
			super(x, y, graphic, mask);
		}
	}
}