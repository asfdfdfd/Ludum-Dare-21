package com.asfdfdfd.games.ld21.world.world05
{
	import com.asfdfdfd.games.ld21.Assets;
	
	import flash.utils.ByteArray;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	public class Room05 extends Entity
	{
		private var _tilemap05:Tilemap = new Tilemap(Assets.IMAGE_TILESET, 640, 480, 32, 32);
		
		public function Room05(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{			
			type = "Room";
			
			graphic = _tilemap05;
			
			var levelData:String = (new Assets.MAP_ROOM05 as ByteArray).toString();
			_tilemap05.loadFromString(levelData);
			
			var grid:Grid = _tilemap05.createGrid([1]);
			mask = grid;
			
			super(x, y, graphic, mask);
		}
	}
}