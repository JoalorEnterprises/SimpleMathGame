package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flixel.addons.text.FlxTypeText;
import flixel.addons.text.FlxTypeTextEvent;

import PlayState;

class LeaderboardState extends FlxState
{
    var save:FlxSave;
    var leaderboard:FlxText;
    var highScores:Array<Dynamic>;

    override public function create()
    {
        leaderboard = new FlxText(10, 150, 200, 'Leaderboard:');
        leaderboard.setFormat(Paths.font('vcr.ttf'), 25, FlxColor.WHITE, FlxTextAlign.LEFT,FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
        add(leaderboard);
        
        highScores = FlxG.save.data.scores;

        if (highScores == null)
        {
            highScores = [];
        }

        FlxG.camera.fade(FlxColor.BLACK, 0.33, true);

        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE)
        {
            FlxG.switchState(new MenuState());
        }
    }

    public function saveScore()
    {
        highScores.push({score: score});
    }
}