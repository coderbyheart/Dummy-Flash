package 
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * Dummy Flash
	 * 
	 * @author Markus Tacker <m@tacker.org>
	 */
	public class Main extends Sprite 
	{
		private var tf:TextField;
		private var tff:TextFormat;
		
		public function Main():void 
		{
			tf = new TextField();
			tff = new TextFormat("_sans", 20, 0x000000, true);
			tf.defaultTextFormat = tff;
			addChild(tf);
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			update();
			stage.addEventListener(Event.RESIZE, resizeListener);
		}
		
		private function resizeListener(e:Event = null):void 
		{
			update();
		}
		
		private function update():void
		{
			
			tf.text = stage.stageWidth + "x" + stage.stageHeight;
			tf.x = stage.stageWidth / 2 - tf.textWidth / 2;
			tf.y = stage.stageHeight / 2 - tf.textHeight / 2;
			tf.filters = [new GlowFilter(0xFFFFFF)];
			graphics.clear();
			graphics.lineStyle(1, 0x000000);
			graphics.beginFill(uint(Math.random() * 255 * 255 * 255), 1);			
			graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			graphics.moveTo(stage.stageWidth / 2, 0);
			graphics.lineTo(stage.stageWidth / 2, stage.stageHeight);
			graphics.moveTo(0, stage.stageHeight / 2);
			graphics.lineTo(stage.stageWidth, stage.stageHeight / 2);
			
		}
		
	}
	
}