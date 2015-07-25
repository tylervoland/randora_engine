module owned.sdl_image.sdl_image;

import owned.sdl_image;
class RNDSDLImage(Master) : RNDOwned!(Master){
	import derelict.sdl2.image;
	
	this(Master master){
		super(master);
	}
	
	override void on_init(){
		super.on_init();
		
		DerelictSDL2Image.load();
		
		int img_init = (IMG_Init(IMG_INIT_PNG) & IMG_INIT_PNG);
		assert(img_init == 2);
	}
}
