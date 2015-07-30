module randora_engine.owned.audio_mixer.audio_mixer;

import randora_engine.owned.audio_mixer;
class RNDAudioMixer(Master) : RNDOwned!(Master){
	import derelict.sdl2.mixer;
	
	this(Master master){
		super(master);
		//this.xmusic = new AmaryllisSuite!(typeof(this))(this);
	}
	
	~this(){
		//Mix_Quit();
	}
	/+
	@property{
		import game.music;
		private AmaryllisSuite!(typeof(this)) _xmusic = null;
		public ref AmaryllisSuite!(typeof(this)) xmusic(){ return this._xmusic; }
	}
	+/
	override void on_init(){
		super.on_init();
		DerelictSDL2Mixer.load();
		assert(Mix_Init(0) == 0);
	}
	
	override void on_load(){
		super.on_load();
		Mix_VolumeMusic(MIX_MAX_VOLUME / 10);
		//this.xmusic.load();
	}
	
	void play(){
		//this.xmusic.play();
	}
}
