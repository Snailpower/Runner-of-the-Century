package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
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


class Level_HG extends FlxState
{
	private var bg:FlxBackdrop;
	private var mg:FlxBackdrop;
	private var fg:FlxSprite;
	
	var floor : FlxSprite;
	var player : Player;
	var loader : FlxOgmoLoader;
	var levelback : FlxTilemap;
	var progBar : FlxBar;
	var barIcon : FlxSprite;
	var collectable : Collectable;
	var collectable2 : FlxSprite;
	var itemCollect : Bool = false;
	
	var objectOne : Obstacle;
	var objectTwo : Obstacle;
	var objectThree : Obstacle;
	var objectFour : Obstacle;
	var objectFive : Obstacle;
	
	var objectGroup : FlxGroup;

	
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
		bg = new FlxBackdrop("assets/images/HG_Assets/HG_BG.png", 0.02, 1, true, false);
		mg = new FlxBackdrop("assets/images/HG_Assets/HG_MG.png", 0.09, 1, true, false);		
		fg = new FlxSprite();
		fg.loadGraphic("assets/images/HG_Assets/HG_FG.png");
	

        // Add the backdrops in order.
			add(bg);
			add(mg);			
			add(fg);
			
		
		
		addObject();
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
		tileMap.loadMapFromCSV("assets/data/Level_HG.csv","assets/images/TileSet.png", TILE_WIDTH, TILE_HEIGHT, 0, 1);
		add(tileMap);
		
		FlxG.worldBounds.width = tileMap.width;
		
	}
	
	private function addObject()
	{
		
		
		objectOne = new Obstacle ("assets/images/HG_Assets/HG_Obj_Berry1.png", 950, 595);
		add (objectOne);
		objectTwo = new Obstacle ("assets/images/HG_Assets/HG_Obj_Berry2.png", 2000, 570);
		add (objectTwo);
		objectThree = new Obstacle ("assets/images/HG_Assets/HG_Obj_Berry2.png", 2550, 560);
		add (objectThree);
		objectFour = new Obstacle ("assets/images/HG_Assets/HG_Obj_Tree.png", 475, 600);
		
		objectFour.offset.y = 30;
		add (objectFour);
		objectFive = new Obstacle ("assets/images/HG_Assets/HG_Obj_Berry1.png", 1500, 550);
		add (objectFive);
		
		objectGroup = new FlxGroup();
		objectGroup.add (objectOne);
		objectGroup.add (objectTwo);
		objectGroup.add (objectThree);
		objectGroup.add (objectFour);
		objectGroup.add (objectFive);
		
		add (objectGroup);
		
		collectable = new Collectable ("assets/images/HG_Assets/HG_Collect.png", 2200, 550);
		add (collectable);		
		
		
		
		
		//Add objects in this function
	}
	
	private function addBar()
	{
		progBar = new FlxBar (136, 160, LEFT_TO_RIGHT, 500, 40);
		progBar.createImageBar("assets/images/timeline.png", null,FlxColor.TRANSPARENT,FlxColor.TRANSPARENT);
		
		barIcon = new FlxSprite (136,160);
		barIcon.loadGraphic("assets/images/timeline_b.png", false);
		
		if (SelectState.gender == "male") 
		{
			barIcon.loadGraphic("assets/images/timeline_b.png", false);
		}
		
		
		else if (SelectState.gender == "female")
		{
			barIcon.loadGraphic("assets/images/timeline_g.png", false);
		}
		
				
		add(progBar);
	
		add(barIcon);
	}

	override public function update(elapsed:Float):Void
	{
	
		super.update(elapsed);
	
		//if (FlxCollision.pixelPerfectCheck (objectOne.object,player.character))
		//{
			//trace ("Object and player collision");
			////player.character.x = player.character.x - 1;
			//player.character.y = player.character.y - 1;
			//if (player.character.x < objectOne.xLoc)
			//{
				//player.character.x = player.character.x - 1;
				//
			//}
			//
			//if (player.character.x > objectOne.xLoc)
			//{
				//player.character.x = player.character.x + 1;
			//}
			//player.character.velocity.x = 0;
			//player.character.velocity.y = 0;
			//
		//}
		FlxG.collide(tileMap, player.character);
		FlxG.collide(objectGroup, player.character);
		
		if (player.character.x <= 640)
		{
		
		barIcon.x = 150 + (0.09 * player.character.x);
		
		}
		
		
		if (player.character.x >= 640 && player.character.x <= 2328)
		{
		progBar.x = (player.character.x - 500);
		barIcon.x = ((player.character.x - 500) + (0.09 * player.character.x));
		
		}
		
		else if (player.character.x >= 2328 )
		{
		progBar.x = 1942;
		barIcon.x = 1940 + 0.1 * player.character.x;
		}
		
		progBar.percent = player.character.x / 30;
		
		if (player.character.x >= 2960 && itemCollect == true )
		{
			switchState();
		}

						
		if (FlxG.keys.pressed.G && (player.character.x - collectable.xLoc <= 25) && (player.character.x - collectable.xLoc >= -25)) 
			{
				itemCollect = true;
				collectable.destroy();
			}
		
		
	
	
		if (player.character.y >= 720)
		{
			player.character.x = player.character.x -50;
			player.character.y = 500;
		}
		
	}
	
	function switchState() 
	{
		FlxG.switchState(new MenuState());
	}


}