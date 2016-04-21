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
		menuTitle = new FlxSprite(0, 0);
		menuTitle.loadGraphic("assets/images/titlescreen.png");
		add(menuTitle);
		
		//Goes from the Title Screen to the Settings Screen
		titleToSettings = new FlxButton(500 , 300 , "Settings" , fncTitleToSettings);
		add(titleToSettings);
		
		//Goes from the Title Screen to the Level Select Screen
		titleToLevels = new FlxButton(0, 300, "Levels" , fncTitleToLevels);
		add(titleToLevels);
	}
	
	private function fncTitleToSettings() 
	{
		remove(menuTitle);
		remove(titleToSettings);
		remove(titleToLevels);
		
		menuSettings = new FlxSprite(0, 0);
		menuSettings.loadGraphic("assets/images/options.png");
		add(menuSettings);
		
		//Goes from the Settings screen to the Title Screen
		settingsToTitle = new FlxButton(0, 300, "Title", fncSettingsToTitle);
		add(settingsToTitle);
		
	}
	
	private function fncSettingsToTitle() 
	{
		remove(settingsToTitle);
		remove(menuSettings);
		
		//Loads the Title Screen
		titleScreen();
		
	}
	
	private function fncTitleToLevels()
	{
		remove(menuTitle);
		remove(titleToLevels);
		remove(titleToSettings);
		
		menuLevels = new FlxSprite(0, 0);
		menuLevels.loadGraphic("assets/images/levelselect.png");
		add(menuLevels);
		
		//Goes from the Level Select to the Title Screen
		levelsToTitle = new FlxButton(550, 300, "Title", fncLevelsToTitle);
		add(levelsToTitle);
		
	}
	
	private function fncLevelsToTitle()
	{
		remove(menuLevels);
		remove(levelsToTitle);
		
		//Loads the Title Screen
		titleScreen();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
	
	
}