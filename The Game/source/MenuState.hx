package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;

class MenuState extends FlxState
{	
	private var bg:FlxSprite;
	private var fg:FlxSprite;
	private var level_1:FlxButton;
	private var centerCam:FlxCamera;
	
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
        fg = new FlxSprite(0,0);
        fg.loadGraphic("assets/images/fg720.png");
        fg.scrollFactor.x = 3;
 
        // move the floor lower so we can see the background.
        fg.y = 460;
 
        // Add the backdrops in order.
        add(bg);
        add(fg);
		
		// Goes to level 1
		level_1 = new FlxButton( 400, 230, "Level 1", switchState);
		level_1.scrollFactor.x = 2;
		level_1.scrollFactor.y = 1;
		add(level_1);
		
		//Positions the camera on the title screen
		FlxG.camera.scroll.add(320, 0);
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
        if (FlxG.keys.justPressed.LEFT) FlxG.camera.scroll.add(-320, 0);
        if (FlxG.keys.justPressed.RIGHT) FlxG.camera.scroll.add(320, 0);
		if (FlxG.keys.justPressed.UP) FlxG.camera.scroll.add(0, -10);
		if (FlxG.keys.justPressed.DOWN) FlxG.camera.scroll.add(0, 10);
		
		FlxG.camera.setScrollBounds( 0, 1920, 0, 720);
	}
	
	
}