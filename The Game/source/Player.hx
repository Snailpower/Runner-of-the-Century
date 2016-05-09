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
	
	var runningSpeed = 200;
	var jumpSpeed = 100;
	
	

	public function new() 
	{
		super();
		character= new FlxSprite (200,200);
		character.loadGraphic("assets/images/character_sheet.png", true, 64, 64);
		character.animation.add("stand", [0], 30, true, false, false);
		character.animation.play("stand");
		character.updateHitbox();
		character.acceleration.y = 200;
		character.drag.set(300,500);
		character.solid = true;
		this.solid = true;
		
	}
	
	
	override public function update(elapsed:Float):Void
	{
		
		character.acceleration.x = 0;
		
		
		//character.x = this.x - 150;
		//character.y = this.y - 120;
		//
			
		if (FlxG.keys.pressed.LEFT)
		{
			character.acceleration.x = -70;
			
			character.animation.stop;
			character.animation.add("walk_left", [1, 2, 3, 4, 5, 6, 7, 8], 30, true, true, false);
			character.animation.play("walk_left");
		}
		
		else if (FlxG.keys.pressed.RIGHT)
		{
			character.acceleration.x = 70;
			character.flipX = false;
			character.animation.stop;
			character.animation.add("walk_right", [1, 2, 3, 4, 5, 6, 7, 8], 30, true, false, false);
			character.animation.play("walk_right");
			
		}
		
		if (FlxG.keys.pressed.UP && character.velocity.y <5 && FlxG.keys.pressed.RIGHT)
		{
			character.velocity.y = -130;
			
			character.animation.stop;
			character.animation.add("jump_right", [9, 10, 11, 12, 13], 15, false, false, false);
			character.animation.play("jump_right");
			
		}
		
		if (FlxG.keys.pressed.UP && character.velocity.y <5 && FlxG.keys.pressed.LEFT)
		{
			character.velocity.y = -130;
			
			character.animation.stop;
			character.animation.add("jump_left", [9, 10, 11, 12, 13], 15, false, true, false);
			character.animation.play("jump_left");
			
		}
		
		if (FlxG.keys.pressed.UP && character.velocity.y <5)
		{
			character.velocity.y = -130;
			
		}
		
		if (character.velocity.y >5) 
		{
			character.animation.stop;
			character.animation.add("jump_up", [9, 10, 11, 12, 13], 15, false, false, false);
			character.animation.play("jump_up");
		}
		
		
		super.update(elapsed);
		
		
	}
}