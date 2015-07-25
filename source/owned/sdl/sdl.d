module rnd.owned.sdl.sdl;

import rnd.owned.sdl;
class RNDSDL(Master) : RNDOwned!(Master){
	import derelict.sdl2.sdl;
	
	this(Master master){
		super(master);
		
		DerelictSDL2.load();
		this.audio_mixer	= new RNDAudioMixer!(typeof(this))(this);
		this.sdl_image		= new RNDSDLImage!(typeof(this))(this);
		this.true_type_font	= new RNDTrueTypeFont!(typeof(this))(this);
		this.open_audio		= new RNDOpenAudio!(typeof(this))(this);
	}
	
	@property{
		import rnd.owned.audio_mixer;
		private RNDAudioMixer!(typeof(this)) _audio_mixer = null;
		public ref RNDAudioMixer!(typeof(this)) audio_mixer(){ return this._audio_mixer; }
	}
	
	@property{
		import rnd.owned.sdlimage;
		private RNDSDLImage!(typeof(this)) _sdl_image = null;
		public ref RNDSDLImage!(typeof(this)) sdl_image(){ return this._sdl_image; }
	}
	
	@property{
		import rnd.owned.open_audio;
		private RNDOpenAudio!(typeof(this)) _open_audio = null;
		public ref RNDOpenAudio!(typeof(this)) open_audio(){ return this._open_audio; }
	}
	
	@property{
		import rnd.owned.true_type_font;
		private RNDTrueTypeFont!(typeof(this)) _true_type_font = null;
		public ref RNDTrueTypeFont!(typeof(this)) true_type_font(){ return this._true_type_font; }
	}
	
	override void on_init(){
		super.on_init();
		this.audio_mixer.init();
		this.sdl_image.init();
		this.true_type_font.init();
		this.open_audio.init();
	}
	
	override void on_load(){
		super.on_load();
		this.audio_mixer.load();
	}
}
