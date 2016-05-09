package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxCamera;
import flixel.FlxBasic;
import flixel.util.FlxColor;
import flixel.addons.editors.ogmo.FlxOgmoLoader;

class PlayState extends FlxState
{
	private var bg:FlxBackdrop;
	private var fg:FlxBackdrop;
	
	var floor : FlxSprite;
	var player : Player;
	var loader : FlxOgmoLoader;
	var levelfloor : FlxTilemap;
	var levelback : FlxTilemap;
	
	var background : FlxSprite;
	
	private var tileMap:FlxTilemap;
	static var TILE_WIDTH:Int = 16;
	static var TILE_HEIGHT:Int = 16;
	
	override public function create():Void
	{
		super.create();
		
		//background= new FlxSprite ();
		//background.loadGraphic("assets/images/LevelOneBG.png");
		//add (background);
		
		
		//tileMap = new FlxTilemap();
		//tileMap.loadMapFromCSV("assets/data/HuntersTileV2.csv","assets/images/Tiles.png", TILE_WIDTH, TILE_HEIGHT, 0, 1);
		////tileMap.loadMap(Assets.getText("assets/data/HuntersTileV2.csv"), "assets/images/Tiles.png", TILE_WIDTH, TILE_HEIGHT, 0, 1);
		//add(tileMap);
		//
		parrallax();
		
	

	}
	
	private function parrallax()
	{
		bg = new FlxBackdrop("assets/images/LevelOneBG.png",2,1,true,false);

        // Add the backdrops in order.
			add(bg);
			
		
		addPlayer();
	
		
	}
	
	private function addPlayer()
	{
		player = new Player();
		add(player);
		add(player.character);
		FlxG.camera.follow(player.character);
		FlxG.camera.style = FlxCameraFollowStyle.LOCKON;
		//FlxG.camera.height = 200;
		
		tileMap = new FlxTilemap();
		tileMap.loadMapFromCSV("assets/data/HuntersV4.csv","assets/images/TileSet.png", TILE_WIDTH, TILE_HEIGHT, 0, 1);
		//tileMap.loadMap(Assets.getText("assets/data/HuntersTileV2.csv"), "assets/images/Tiles.png", TILE_WIDTH, TILE_HEIGHT, 0, 1);
		add(tileMap);
		
	
		
		
				
		
		
	}
	

	override public function update(elapsed:Float):Void
	{
	
		
		//if (FlxG.keys.pressed.LEFT) FlxG.camera.scroll.add(-3, 0);
        //if (FlxG.keys.pressed.RIGHT) FlxG.camera.scroll.add(3, 0);
		
		//FlxG.collide(floor, player);
		super.update(elapsed);
	
		//FlxG.collide(floor, player.character);
		FlxG.collide(tileMap, player.character);
		
		if (FlxG.collide(tileMap, player.character))
		{
			trace (player.character.x);
			trace (tileMap.x);
		}
		
				
		//trace(player.character.x);
		
		
		if (FlxG.keys.pressed.L)
		{
			//character.acceleration.x = -70;
			trace (player.character.x);
					
		}
		
		 
		 
		 
		 //trace (fg.y);
		 //trace (player.character.y);
		 //trace (player.y);
		 
		 
		 
		 
		
		
		
	}
}