package com.asfdfdfd.games.ld21.world.world03
{
	import com.asfdfdfd.games.ld21.Assets;
	
	import flash.utils.ByteArray;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	public class Room03 extends Entity
	{
		private var _tilemap03:Tilemap = new Tilemap(Assets.IMAGE_TILESET, 640, 480, 32, 32);
		
		public function Room03(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{			
			type = "Room";
			
			graphic = _tilemap03;
			
			var levelData:String = (new Assets.MAP_ROOM03 as ByteArray).toString();
			_tilemap03.loadFromString(levelData);
			
			var grid:Grid = _tilemap03.createGrid([1]);
			mask = grid;
			
			super(x, y, graphic, mask);
		}
	}
}