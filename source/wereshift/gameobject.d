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
module wereshift.gameobject;
public import wereshift.iovr;
public import wereshift.screens;
public import polyplex.core;
public import polyplex.math;

public abstract class GameObjectFactory {
	public abstract GameObject Construct(Level level, Vector2 spawn_point);
}

public class GameObject {
	protected Level parent;
	protected Vector2 spawn_point;

	public bool Alive = true;

	this(Level parent, Vector2 spawn_point) {
		this.parent = parent;
		this.spawn_point = spawn_point;
	}

	public abstract void LoadContent(ContentManager content);
	public abstract void Update(GameTimes game_time);
	public abstract void Draw(GameTimes game_time, SpriteBatch sprite_batch);
}