package gameScene.object.home
{
	import flash.display.Bitmap;
	
	import gameScene.MainStage;
	import gameScene.object.Objects;
	import gameScene.util.PlayerState;
	
	import trolling.component.graphic.Image;
	import trolling.event.TrollingEvent;
	import trolling.rendering.Texture;
	import trolling.utils.PivotType;
	
	public class Home extends Objects
	{
		[Embed(source="home0.png")]
		private static const home0:Class;
		
		public function Home()
		{
			_stageWidth = MainStage.stageWidth;
			_stageHeight = MainStage.stageHeight;
			
			this.pivot = PivotType.CENTER;
			
			this.x = _stageWidth / 2;
			this.y = _stageHeight * 0.4;
			
			this.width = _stageWidth * 0.1;
			this.height = this.width;
//			
//			this.scaleY = (this.y - (_stageHeight / 3)) / 100;
//			this.scaleX = scaleY;
			
			_bitmap = new home0() as Bitmap;
			_image = new Image(new Texture(_bitmap));
			
			addComponent(_image);
			
			addEventListener(TrollingEvent.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:TrollingEvent):void
		{	
			this.scaleY += 0.04 * MainStage.speed;
			this.scaleX = this.scaleY;
			this.y += MainStage.speed;
			
			if(this.y >= (_stageHeight * 0.4) + (MainStage.speed * 16))
			{
				removeEventListener(TrollingEvent.ENTER_FRAME, onEnterFrame);
				dispatchEvent(new TrollingEvent(PlayerState.ARRIVE));
				return;
			}
		}
	}
}