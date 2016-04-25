package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;

class MenuState extends FlxState
{
	private var menuTitle:FlxSprite;
	private var menuLevels:FlxSprite;
	private var menuSettings:FlxSprite;
	private var titleToSettings:FlxButton;
	private var settingsToTitle:FlxButton;
	private var titleToLevels:FlxButton;
	private var levelsToTitle:FlxButton;
	
	override public function create():Void
	{
		super.create();
		
		titleScreen();
	}
	
	private function titleScreen()
	{
		// Create image that scrolls at x2 speed based on the camera's scroll
        var bg:FlxSprite = new FlxSprite(0,0);
        bg.loadGraphic("assets/images/overview.png");
        bg.scrollFactor.x = 2;
 
        // Create image that scrolls at x3 speed based on the camera's scroll
        var fg:FlxSprite = new FlxSprite(0,0);
        fg.loadGraphic("assets/images/messedupmushroom.png");
        fg.scrollFactor.x = 3;
 
        // move the floor lower so we can see the background.
        fg.y = 300;
 
        // Add the backdrops in order.
        add(bg);
        add(fg);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		// Test input to scroll the camera. FlxBackdrop will
        // handle the parallax scrolling automatically.
        if (FlxG.keys.pressed.LEFT) FlxG.camera.scroll.add(-2, 0);
        if (FlxG.keys.pressed.RIGHT) FlxG.camera.scroll.add(2, 0);
		if (FlxG.keys.pressed.UP) FlxG.camera.scroll.add(0, -2);
		if (FlxG.keys.pressed.DOWN) FlxG.camera.scroll.add(0, 2);
		
		FlxG.camera.setScrollBounds( 0, 950, 0, 772);
	}
	
	
}