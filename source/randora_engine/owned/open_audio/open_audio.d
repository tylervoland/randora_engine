module randora_engine.owned.open_audio.open_audio;

import randora_engine.owned.open_audio;
class RNDOpenAudio(Master) : RNDOwned!(Master){
	import derelict.sdl2.mixer;
	
	this(Master master){
		super(master);
	}
	
	override void on_init(){
		super.on_init();
		int mix_openaudio = Mix_OpenAudio(44100, MIX_DEFAULT_FORMAT, 2, 2048);
		assert(mix_openaudio == 0);//Mix_GetError()
	}
}
