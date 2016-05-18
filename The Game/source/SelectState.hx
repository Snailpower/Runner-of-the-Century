package;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxG;
import haxe.Timer;

/**
 * ...
 * @author Tom
 */
class SelectState extends FlxState
{
	private var btn_boy: FlxButton;
	private var btn_girl: FlxButton;
	private var delayTimer : Timer;
	
	public static var gender : String;

	override public function create():Void
	{
		super.create();
		
		buttons();
		
		//delayTimer = new Timer(2000);
		//delayTimer.stop;
	}
	
	private function buttons()
	{
		btn_boy =  new FlxButton(0, 0, null, menustateBoy);
		btn_boy.loadGraphic("assets/images/click_animation_boy.png", true, 260, 472);
		btn_boy.animation.add("click_boy", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], 5, true);
		
		btn_girl = new FlxButton(620, 0, null, menustateGirl);
		btn_girl.loadGraphic("assets/images/click_animation_girl.png", true, 260, 472);
		btn_girl.animation.add("click_girl", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], 5, true);
		
		add(btn_boy);
		add(btn_girl);
	}
	
	private function menustateBoy()
	{
		gender = "male";
		
		btn_boy.animation.play("click_boy");
		
		//delayTimer.run = switchState;
		
		switchState();
	}
	
	private function menustateGirl()
	{
		gender = "female";
		
		btn_girl.animation.play("click_girl");
		
		//delayTimer.run = switchState;
		
		switchState();
	}
	
	private function switchState()
	{
		FlxG.switchState(new MenuState());
		
		//delayTimer.stop;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}