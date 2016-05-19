package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
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
	private var btn_right:FlxSprite;
	private var btn_left:FlxSprite;
	private var prof:FlxSprite;
	private var menuMusic:FlxSound;
	
	private var option_btn:FlxButton;
	private var volume_up:FlxButton;
	private var volume_down:FlxButton;
	private var instruction_btn:FlxButton;
	private var back_btn:FlxButton;
	
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
		
		// Create Buttons to indicate the movement between the screens
		btn_right = new FlxSprite(1710, 5);
		btn_right.loadGraphic("assets/images/btn_right.png", true);
		
		btn_right.animation.add("blink", [0, 1], 2, true);
		btn_right.scrollFactor.x = 2;
		
		btn_left = new FlxSprite(720, 5);
		btn_left.loadGraphic("assets/images/btn_left.png", true);
		
		btn_left.animation.add("blink", [0, 1], 2, true);
		btn_left.scrollFactor.x = 2;
		
		// Creates The professor
		prof = new FlxSprite(900, 280);
		prof.loadGraphic("assets/images/prof_spritesheet.png");
		prof.scrollFactor.x = 0.50;
		prof.flipX = true;
 
        // move the floor lower so we can see the background.
        fg.y = 460;
 

        // Add the backdrops in order.
        add(bg);
		
		// Add the professor
		add(prof);
		
        add(fg);
		
		// Add the arrows in order and makes them blink
		add(btn_left);
		btn_left.animation.play("blink");
		
		add(btn_right);
		btn_right.animation.play("blink");
		
		// Creates the button that goes to level 1 on click
		level_1 = new FlxButton( 400, 192, null, switchState);
		level_1.loadGraphic("assets/images/HG_Icon.png");
		level_1.scrollFactor.x = 2;
		level_1.scrollFactor.y = 1;
		add(level_1);
		
		// Creates the option and instruction buttons
		option_btn = new FlxButton (1968, 204, "Options", optionsOnClick);
		option_btn.scrollFactor.x = 2;
		
		instruction_btn = new FlxButton(1968, 264, "Instructions", instructions);
		instruction_btn.scrollFactor.x = 2;
		
		add(instruction_btn);
		add(option_btn);
		
		// Plays the menumusic
		menuMusic = new FlxSound();
		menuMusic.loadEmbedded("assets/music/menuMusic.mp3", true);
		menuMusic.play();
		
		//Positions the camera on the title screen
		FlxG.camera.scroll.add(320, 0);
		
		FlxG.camera.setScrollBounds( 0, 1920, 0, 720);
		delayTimer = new Timer(25);
		delayTimer.stop;
	}
	
	public function switchState()
	{
			menuMusic.stop();
			
			FlxG.switchState(new PlayState());
	}
	
	private function optionsOnClick()
	{
		remove(option_btn);
		remove(instruction_btn);
		
		volume_up = new FlxButton(1968, 204, "+", volumeUp);
		volume_up.scrollFactor.x = 2;
		
		volume_down = new FlxButton(1968, 234, "-", volumeDown);
		volume_down.scrollFactor.x = 2;
		
		back_btn = new FlxButton(1968, 324, "back", menuReturn);
		back_btn.scrollFactor.x = 2;
		
		add(back_btn);
		add(volume_up);
		add(volume_down);
	}
	
	private function menuReturn()
	{
		remove(volume_down);
		remove(volume_up);
		remove(back_btn);
		
		add(option_btn);
		add(instruction_btn);
	}
	
	private function volumeUp()
	{
		menuMusic.volume = menuMusic.volume + 0.1;
	}
	
	private function volumeDown()
	{
		menuMusic.volume = menuMusic.volume - 0.1;
	}
	
	private function instructions()
	{
		remove(option_btn);
		remove(instruction_btn);
		
		back_btn = new FlxButton(1968, 324, "back", menuReturn);
		back_btn.scrollFactor.x = 2;
		add(back_btn);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		// Test input to scroll the camera. FlxBackdrop will
        // handle the parallax scrolling automatically.
        if (FlxG.keys.justPressed.LEFT) 
		{
			prof.flipX = false;
			
			if(FlxG.camera.scroll.x >= 0) {
				amountToMove *= -1;
			if (amountToMove > 0)
				amountToMove *= -1;
				
			cameraMovement = true;
			delayTimer.run = MoveCamera;
			}
		}
		
        if (FlxG.keys.justPressed.RIGHT) 
		{
			prof.flipX = true;
			
			cameraMovement = true;
			amountToMove = Math.abs(amountToMove);
			delayTimer.run = MoveCamera;
			
		}
		
	}
	
	function MoveCamera() 
	{		
		if (cameraMovement == true)
		{
			FlxG.camera.scroll.add(amountToMove, 0);
		}
			
		if (FlxG.camera.scroll.x == -5 )
				{
					FlxG.camera.scroll.x = 0;
					delayTimer.stop;
					cameraMovement = false;
					
					remove(btn_left);
					remove(btn_right);
					
					btn_right.x = 760;
					add(btn_right);
					
					//prof.x = 300;
					//
					//prof.flipX = true;
				}
				
		if (FlxG.camera.scroll.x == 640)
			{
				delayTimer.stop;
				cameraMovement = false;
				
				remove(btn_left);
				remove(btn_right);
				
				btn_left.x = 1710;
				add(btn_left);
				
				//prof.x = 1440;
				//prof.flipX = true;
			}
			
			if (FlxG.camera.scroll.x == 320)
			{
				delayTimer.stop;
				cameraMovement = false;
				
				remove(btn_left);
				remove(btn_right);
				
				btn_right.x = 1710;
				add(btn_right);
				
				btn_left.x = 720;
				add(btn_left);
				
				//prof.x = 1440;
				//prof.flipX = false;
			}
			
			
	}
	
}