package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;
import haxe.Timer;

class MenuState extends FlxState
{	
	private var bg:FlxSprite;
	private var fg:FlxSprite;
	private var level_1:FlxButton;
	private var centerCam:FlxCamera;
	private var scrollTimer: FlxTimer = new FlxTimer();
	private var cameraMovement: Bool = false;
	private var amountToMove : Float = 5;
	private var delayTimer : Timer;
	override public function create():Void
	{
		super.create();
		
		titleScreen();
	}
	
	private function titleScreen()
	{
		// Create image that scrolls at x2 speed based on the camera's scroll
        bg = new FlxSprite(0,0);
        bg.loadGraphic("assets/images/ms720.png");
        bg.scrollFactor.x = 2;
 
        // Create image that scrolls at x3 speed based on the camera's scroll
        fg = new FlxSprite(320,0);
        fg.loadGraphic("assets/images/fg720.png");
        fg.scrollFactor.x = 3;
 
        // move the floor lower so we can see the background.
        fg.y = 460;
 
        // Add the backdrops in order.
        add(bg);
        add(fg);
		
		// Goes to level 1
		level_1 = new FlxButton( 400, 192, null, switchState);
		level_1.loadGraphic("assets/images/HG_Icon.png");
		level_1.scrollFactor.x = 2;
		level_1.scrollFactor.y = 1;
		add(level_1);
		
		//Positions the camera on the title screen
		FlxG.camera.scroll.add(320, 0);
		
		FlxG.camera.setScrollBounds( 0, 1920, 0, 720);
		delayTimer = new Timer(25);
		delayTimer.stop;
	}
	
	public function switchState()
	{
			FlxG.switchState(new PlayState());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		// Test input to scroll the camera. FlxBackdrop will
        // handle the parallax scrolling automatically.
        if (FlxG.keys.justPressed.LEFT) 
		{
			
			if(FlxG.camera.scroll.x >= 0) {
				amountToMove *= -1;
			if (amountToMove > 0)
				amountToMove *= -1;
				
			cameraMovement = true;
			delayTimer.run = MoveCamera;
				//trace(amountToMove);
			}
		}
		
		//if (FlxG.keys.justReleased.LEFT || FlxG.keys.justReleased.RIGHT) cameraMovement = false;
		
        if (FlxG.keys.justPressed.RIGHT) 
		{
			cameraMovement = true;
			amountToMove = Math.abs(amountToMove);
			delayTimer.run = MoveCamera;
			//trace(amountToMove);
		}
		
		/*while(cameraMovement){
				//trace(FlxG.camera.x);
				/*if (FlxG.camera.scroll.x == 0 || FlxG.camera.scroll.x == 320 || FlxG.camera.scroll.x == 640)
				{
					cameraMovement = false;
					delayTimer.stop;
					trace(FlxG.camera.scroll.x);
				}
				//if (cameraMovement == false)
					
		}
		
		/*if (cameraMovement) 
		{
			FlxG.camera.scroll.add(amountToMove, 0);
		}
		*/
		
	}
	
	function MoveCamera() 
	{		
		if(cameraMovement == true)
			FlxG.camera.scroll.add(amountToMove, 0);
		trace(FlxG.camera.scroll.x);
		if (FlxG.camera.scroll.x == -5 )
				{
					FlxG.camera.scroll.x = 0;
					delayTimer.stop;
					cameraMovement = false;
				}
				
		if (FlxG.camera.scroll.x == 660)
			{
				delayTimer.stop;
				cameraMovement = false;
			}
			
			if (FlxG.camera.scroll.x == 320)
			{
				delayTimer.stop;
				cameraMovement = false;
			}
			
			
	}
	
}