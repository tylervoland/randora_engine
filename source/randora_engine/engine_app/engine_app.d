module randora_engine.engine_app.engine_app;

import randora_engine.engine_app;

class EngineApp(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	public bool						quit	= false;
	public SDLSDL!(typeof(this))	sdl		= null;
	public RNDWindow!(typeof(this))	window	= null;
	
	this(Master master = null){
		super(master);
		
		this.type = "BaseApp";
		this.name = "base_app";
		
		this.stretch.x = this.stretch.STRETCH.NONE;
		this.stretch.y = this.stretch.STRETCH.NONE;
		this.dimension.x = 640;
		this.dimension.y = 480;
		
		this.sdl = new SDLSDL!(typeof(this))(this);
		assert(this.sdl !is null);
		
		this.window = new RNDWindow!(typeof(this))(this);
		assert(this.window !is null);
	}
	
	override void on_event(){
		super.on_event();
		this.window.event();
	}
	
	override void on_init(){
		this.sdl.init();
		this.window.init();
		super.on_init();
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
	
	override void on_start(){
		super.on_start();
		
		this.sdl.start();
		this.window.start();
		
		this.init();
		this.update();
		this.load();
		this.update();
		//this.sdl.audio_mixer.play();
		this.game_loop();
	}
}
