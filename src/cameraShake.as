package 
{
	import net.flashpunk.*;
	
	public class cameraShake extends Entity
	{
		public static var cameraJitterCounter:int = 0;
		private static var saveCameraY:Number;
		
		public function cameraShake() 
		{
			
		}
		
		public static function activateCameraJitter(jitterCount:int):void
		{
			if (cameraJitterCounter == 0) {  // if already shaking do nothing
				cameraJitterCounter = jitterCount;
				saveCameraY = FP.camera.y;
			}
		}
		
		override public function update():void
		{
			if (cameraJitterCounter > 0)
			{ 
				cameraJitterCounter--;
				if (cameraJitterCounter == 0)
				{
					FP.camera.y = saveCameraY;  
				}
				else
				{
					var cameraYOffset:Number = Math.random() * cameraJitterCounter;
					if (Math.random() < 0.5)
					{
						cameraYOffset = -cameraYOffset;
					}					
					FP.camera.y = saveCameraY + cameraYOffset;
				}
			}
		}
	}
}