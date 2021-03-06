/*
MIT License

Copyright (c) 2018 Clipsey

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
module wereshift.screens.scorescreen;
import wereshift.screen;
import wereshift.ui;
import wereshift.game;
import std.conv;
import std.stdio;

public class ScoreScreen : Screen {
	UILabel you_died;
	UILabel text;
	UIButton menu;

	public void SetCallback(UIButton.ButtonCallback callback) {
		this.menu.SetCallback(callback);
	}

	this(ContentManager content) {
		super(content);
	}

	public override void Init() {
		this.you_died = new UILabel(new Rectangle(0, 0, 0, 0), null, "YOU DIED", 1f, Color.Transparent, Color.Red);
		this.text = new UILabel(new Rectangle(0, 0, 0, 0), null, 
		"You survived " ~ GAME_INFO.Night.text ~ " nights!\n" ~
		"You killed " ~ GAME_INFO.Souls.text ~ " villagers!\n" ~
		"You have taken " ~ GAME_INFO.DamageTaken.text ~ " of total damage from enemies!\n\n" ~
		"Total Score: " ~ GAME_INFO.Score.text ~ "!", 
		0.95f, Color.Transparent, Color.White);
		this.menu = new UIButton(new Rectangle(0, 0, 0, 0), null, "<--", "Back to main menu.");
	}

	public override void Update(GameTimes game_time) {
		menu.Area.X = (cast(int)WereshiftGame.Bounds.X/2)-(menu.Area.Width/2);
		menu.Area.Y = (cast(int)WereshiftGame.Bounds.Y/2)-(menu.Area.Height/2);
		you_died.Area.X = (cast(int)WereshiftGame.Bounds.X/2)-(you_died.Area.Width/2);
		you_died.Area.Y = 32;
		text.Area.X = 32;
		text.Area.Y = 64;
		
		you_died.Update(game_time);
		text.Update(game_time);
		menu.Update(game_time);
	}

	public override void Draw(GameTimes game_time, SpriteBatch sprite_batch) {
		sprite_batch.Begin();
		you_died.Draw(game_time, sprite_batch);
		text.Draw(game_time, sprite_batch);
		menu.Draw(game_time, sprite_batch);
		sprite_batch.End();
	}

}