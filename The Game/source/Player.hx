package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author Daan
 */
class Player extends FlxObject
{
	public var character : FlxSprite;
	private var _moving : Bool;
	private var _active:Bool = true;
	private var _lastAnimationSide:String;
	
	var runningSpeed = 200;
	var jumpSpeed = 100;
	

	public function new() 
	{
		super();
		character = new FlxSprite (200, 200);
		
		if (SelectState.gender == "male") 
		{
			character.loadGraphic("assets/images/character_sheet_boy.png", true, 37, 63);
		}
		
		else if (SelectState.gender == "female")
		{
			character.loadGraphic("assets/images/character_sheet_girl.png", true, 37, 63);
		}
		
		character.maxVelocity.x = 200;
		
		character.width = 37;
		character.offset.x = 0;
		
		//Gravity
		character.acceleration.y = 600;
		
		//Horizontal Drag
		character.drag.set(2000, 500);
		
		character.solid = true;
		this.solid = true;
		
		animations();
	}
	
	public function animations()
	{
		character.animation.add("standRight", [0], 30, true, false, false);
		character.animation.add("standLeft", [0], 30, true, true, false);
		character.animation.add("walk_left", [1, 2, 3, 4, 5, 6, 7, 8], 15, true, true, false);
		character.animation.add("walk_right", [1, 2, 3, 4, 5, 6, 7, 8], 15, true, false, false);
		character.animation.add("jump_right", [9, 10, 11, 12, 13, 0], 15, false, false, false);
		character.animation.add("jump_left", [9, 10, 11, 12, 13, 0], 15, false, true, false);
		character.animation.add("fall_right", [12], 15, false, false, false);
		character.animation.add("fall_left", [12], 15, false, true, false);
	}
	
	
	override public function update(elapsed:Float):Void
	{
		
		trace (character.velocity.x);
		
		character.acceleration.x = 0;
		
		//character.x = this.x - 150;
		//character.y = this.y - 120;
		//
		if (_active) 
		{
			if (FlxG.keys.pressed.LEFT) 
			{
			character.acceleration.x = -100;
			}
			
			else if (FlxG.keys.pressed.RIGHT) 
			{
				character.acceleration.x = 100;
				character.flipX = false;
			}
			
			if (FlxG.keys.anyPressed(["LEFT"]))
			{
				character.animation.play("walk_left");
				_moving = true;
				_lastAnimationSide = "Left";
			}
		
			else if (FlxG.keys.anyPressed(["RIGHT"]))
			{
				character.animation.play("walk_right");
				_moving = true;
				_lastAnimationSide = "Right";
			}
		
			else if (FlxG.keys.pressed.UP && character.velocity.y >-5 && character.velocity.x == 0)
			{
				
				_moving = true;
				
				switch (_lastAnimationSide) 
				{
					case "Right":	character.animation.play("jump_right");
					case "Left"	:	character.animation.play("jump_left");
						
				}
			
			}
			
			if (character.velocity.y >0) 
			{
				switch (_lastAnimationSide) 
				{
					case "Right":	character.animation.play("fall_right");
					case "Left"	:	character.animation.play("fall_left");
				}
			}
		
			if (FlxG.keys.justPressed.UP && character.velocity.y == 0) 
			{
				character.velocity.y = -240;
			}
			
			if (character.velocity.x == 0 && character.velocity.y == 0) 
			{
				_moving = false;
				switch (_lastAnimationSide) 
				{
					case "Right":	character.animation.play("standRight");
					case "Left":	character.animation.play("standLeft");
				}
			}
		}
		
		if (character.x < 0)
		{
			character.x = 0;
			character.acceleration.x = 0;
		}
		
		
		super.update(elapsed);
		
		
	}
}