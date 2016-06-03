package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;


/**
 * ...
 * @author Daan
 */
class Collectable extends FlxSpriteGroup
{
	public var imagePath: String;
	public var xLoc : Int;
	public var yLoc : Int;
	
	public var collectable : FlxSprite;
	
	public function new(i : String, x : Int, y : Int ) 
	{
		super();
		imagePath = i;
		xLoc = x;
		yLoc = y;
		
		create();
	}
	
	function create() 
	{
		collectable = new FlxSprite();
		collectable.loadGraphic(imagePath);
		collectable.x = xLoc;
		collectable.y = yLoc;
		add(collectable);
		
		
	}
	
}