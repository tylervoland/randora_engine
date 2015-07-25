module rnd.owned.true_type_font.true_type_font;

import rnd.owned.true_type_font;
class RNDTrueTypeFont(Master) : RNDOwned!(Master){
	import derelict.sdl2.ttf;
	
	this(Master master){
		super(master);
		
		DerelictSDL2ttf.load();
		
		int ttf_init = TTF_Init();
		assert(ttf_init != -1);//TTF_GetError()
	}
}
