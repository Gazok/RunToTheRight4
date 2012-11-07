package
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import flash.utils.getDefinitionByName;

	[SWF(width = "640", height = "480")]
	
	public class Preloader extends Sprite
	{
		private static const mustClick:Boolean = true;
		private static const mainClassName:String = "Main";
		private static const BG_COLOR:uint = 0x000000, FG_COLOR:uint = 0xFFFFFF;
		[Embed(source = 'net/flashpunk/graphics/04B_03__.TTF', embedAsCFF="false", fontFamily = 'default')] private static const FONT:Class;
		
		private var pb:Shape, t:TextField, px:int, py:int, w:int, h:int = 20, sw:int, sh:int;
		
		public function Preloader()
		{
			sw = stage.stageWidth;
			sh = stage.stageHeight;
			w = stage.stageWidth * 0.8;
			
			px = (sw - w) * 0.5;
			py = (sh - h) * 0.5;
			
			graphics.beginFill(BG_COLOR);
			graphics.drawRect(0, 0, sw, sh);
			graphics.endFill();
			
			graphics.beginFill(FG_COLOR);
			graphics.drawRect(px - 2, py - 2, w + 4, h + 4);
			graphics.endFill();
			
			pb = new Shape;
			addChild(pb);
			
			t = new TextField;
			t.textColor = FG_COLOR;
			t.selectable = t.mouseEnabled = false;
			t.defaultTextFormat = new TextFormat("default", 16);
			t.embedFonts = true;
			t.autoSize = "left";
			t.text = "0%";
			t.x = (sw - t.width) * 0.5;
			t.y = sh * 0.5 + h;
			addChild(t);
			
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			if (mustClick) stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}

		public function onEnterFrame(e:Event):void
		{
			if (hasLoaded())
			{
				graphics.clear();
				graphics.beginFill(BG_COLOR);
				graphics.drawRect(0, 0, sw, sh);
				graphics.endFill();
				
				if (!mustClick) startup();
				else
				{
					t.scaleX = t.scaleY = 2.0;
					t.text = "Click to start";
					t.y = (sh - t.height) * 0.5;
				}
			}
			else
			{
				var p:Number = (loaderInfo.bytesLoaded / loaderInfo.bytesTotal);
				
				pb.graphics.clear();
				pb.graphics.beginFill(BG_COLOR);
				pb.graphics.drawRect(px, py, p * w, h);
				pb.graphics.endFill();
				
				t.text = String(int(p * 100)) + "%";
			}
			
			t.x = (sw - t.width) * 0.5;
		}
		
		private function onMouseDown(e:MouseEvent):void
		{
			if (hasLoaded())
			{
				stage.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
				startup();
			}
		}
		
		private function hasLoaded (): Boolean
		{
			return (loaderInfo.bytesLoaded >= loaderInfo.bytesTotal);
		}
		
		private function startup (): void
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			var mainClass:Class = getDefinitionByName(mainClassName) as Class;
			parent.addChild(new mainClass as DisplayObject);
			
			parent.removeChild(this);
		}
		
	}
	
}