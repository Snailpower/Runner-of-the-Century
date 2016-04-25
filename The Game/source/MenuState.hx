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
	private var bg:FlxSprite;
	private var fg:FlxSprite;
	private var level_1:FlxButton;
	
	override public function create():Void
	{
		super.create();
		
		titleScreen();
	}
	
	private function titleScreen()
	{
		// Create image that scrolls at x2 speed based on the camera's scroll
        bg = new FlxSprite(0,0);
        bg.loadGraphic("assets/images/overview.png");
        bg.scrollFactor.x = 2;
 
        // Create image that scrolls at x3 speed based on the camera's scroll
        fg = new FlxSprite(0,0);
        fg.loadGraphic("assets/images/messedupmushroom.png");
        fg.scrollFactor.x = 3;
 
        // move the floor lower so we can see the background.
        fg.y = 300;
 
        // Add the backdrops in order.
        add(bg);
        add(fg);
		
		// Goes to level 1
		level_1 = new FlxButton( 110, 110, "Level 1", switchState);
		level_1.scrollFactor.x = 2;
		level_1.scrollFactor.y = 1;
		add(level_1);
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
        if (FlxG.keys.pressed.LEFT) FlxG.camera.scroll.add(-3, 0);
        if (FlxG.keys.pressed.RIGHT) FlxG.camera.scroll.add(3, 0);
		if (FlxG.keys.pressed.UP) FlxG.camera.scroll.add(0, -3);
		if (FlxG.keys.pressed.DOWN) FlxG.camera.scroll.add(0, 3);
		
		FlxG.camera.setScrollBounds( 0, 950, 0, 772);
	}
	
	
}