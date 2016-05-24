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
import flixel.util.FlxCollision;
import flixel.ui.FlxBar;
import flixel.addons.ui.FlxUIBar;


class PlayState extends FlxState
{
	private var bg:FlxBackdrop;
	private var fg:FlxBackdrop;
	
	var floor : FlxSprite;
	var player : Player;
	var loader : FlxOgmoLoader;
	var levelfloor : FlxTilemap;
	var levelback : FlxTilemap;
	var progBar : FlxBar;
	var barOverlay : FlxSprite;
	
	var background : FlxSprite;
	
	private var tileMap:FlxTilemap;
	static var TILE_WIDTH:Int = 16;
	static var TILE_HEIGHT:Int = 16;
	
	override public function create():Void
	{
		super.create();
		
		parrallax();
	}
	
	private function parrallax()
	{
		bg = new FlxBackdrop("assets/images/LevelOneBG.png",0,1,true,false);

        // Add the backdrops in order.
			add(bg);
			
		
		addPlayer();
		addBar();
	
		
	}
	
	private function addPlayer()
	{
		player = new Player();
		add(player);
		add(player.character);
		FlxG.camera.follow(player.character);
		FlxG.camera.style = FlxCameraFollowStyle.LOCKON;
		FlxG.camera.setScrollBounds (0, 3000, 0, 720);
		
		tileMap = new FlxTilemap();
		tileMap.loadMapFromCSV("assets/data/LevelOne.csv","assets/images/TileSet.png", TILE_WIDTH, TILE_HEIGHT, 0, 1);
		add(tileMap);
		
		FlxG.worldBounds.width = tileMap.width;
		
	}
	
	private function addObject()
	{
		//Add objects in this function
	}
	
	private function addBar()
	{
		progBar = new FlxBar (390, 160, LEFT_TO_RIGHT, 500, 40);
		progBar.createFilledBar(FlxColor.ORANGE, FlxColor.GREEN);
		
		barOverlay = new FlxSprite (360,140);
		barOverlay.loadGraphic("assets/images/overlaybar.png",false);
				
		add(progBar);
	
		add(barOverlay);
	}

	override public function update(elapsed:Float):Void
	{
	
		super.update(elapsed);
	
		
		FlxG.collide(tileMap, player.character);
		

		
		if (FlxG.collide(tileMap, player.character))
		{
			trace (player.character.x);
			trace (tileMap.x);
		}
		
		
		if (player.character.x >= 640 && player.character.x <= 2328)
		{
		progBar.x = (player.character.x - 234);
		barOverlay.x = (player.character.x - 264);
		}
		
		else if (player.character.x >= 2328 )
		{
		progBar.x = 2096;
		barOverlay.x = 2066;
		}
		
		progBar.percent = player.character.x / 30;
		
		
		if (player.character.x >= 3000)
		{
			switchState();
		}
		
		
	}
	
	function switchState() 
	{
		FlxG.switchState(new MenuState());
	}
}