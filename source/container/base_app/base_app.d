module rnd.container.base_app.base_app;

import rnd.container.base_app;
class BaseApp(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	this(Master master = null){
		super(master);
		
		this.type = "BaseApp";
		this.name = "base_app";
		
		this.stretch.x = this.stretch.STRETCH.NONE;
		this.stretch.y = this.stretch.STRETCH.NONE;
		this.dimension.x = 640;
		this.dimension.y = 480;
		
		this.sdl = new RNDSDL!(typeof(this))(this);
		assert(this.sdl !is null);
		
		this.window = new RNDWindow!(typeof(this))(this);
		assert(this.window !is null);
	}
	
	@property{
		//import rnd.owned.sdl;
		private RNDSDL!(typeof(this)) _sdl = null;
		public ref RNDSDL!(typeof(this)) sdl(){ return this._sdl; }
	}
	
	@property{
		private bool _quit = false;
		public ref bool quit(){ return this._quit; }
	}
	
	@property{
		private RNDWindow!(typeof(this)) _window = null;
		public ref RNDWindow!(typeof(this)) window(){ return this._window; }
	}
	
	override void on_event(){
		super.on_event();
		this.window.event();
	}
	
	override void on_init(){
		super.on_init();
		this.sdl.init();
		this.window.init();
	}
	
	override void on_load(){
		super.on_load();
		this.sdl.load();
		this.window.load();
	}
	
	void game_loop(){
		while(!quit){
			this.event();
			this.loop();
			this.draw();
			this.window.render();
			this.clean();
			this.update();
		}
	}
	
	override void on_draw(){
		super.on_draw();
		this.window.draw();
	}
	
	override void on_clean(){
		super.on_clean();
		this.window.clean();
	}
	
	override void on_update(){
		super.on_update();
		this.window.update();
	}
	
	void start(){
		this.init();
		this.update();
		this.load();
		this.update();
		//this.sdl.audio_mixer.play();
		this.game_loop();
	}
}
