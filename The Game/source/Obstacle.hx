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
class Obstacle extends FlxSpriteGroup

{
	public var imagePath: String;
	public var xLoc : Int;
	public var yLoc : Int;
	
	public var object : FlxSprite;
	
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
		object = new FlxSprite();
		object.loadGraphic(imagePath);
		object.immovable = true;
		object.x = xLoc;
		object.y = yLoc;
		object.solid = true;
		
		add(object);
	
	}
	
	
}