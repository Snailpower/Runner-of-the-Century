package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.display.FlxBackdrop;

class PlayState extends FlxState
{
	private var bg:FlxBackdrop;
	private var fg:FlxBackdrop;
	
	override public function create():Void
	{
		super.create();
		
		parrallax();
	}
	
	private function parrallax()
	{
		bg = new FlxBackdrop("assets/images/huntersBG.png", 2, 0, true, false);

        fg = new FlxBackdrop("assets/images/messedupmushroom.png", 3, 0, true, false);
 
        // move the floor lower so we can see the background.
        //fg.y = 300;
 
        // Add the backdrops in order.
        add(bg);
        add(fg);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.LEFT) FlxG.camera.scroll.add(-3, 0);
        if (FlxG.keys.pressed.RIGHT) FlxG.camera.scroll.add(3, 0);
		
		
	}
}