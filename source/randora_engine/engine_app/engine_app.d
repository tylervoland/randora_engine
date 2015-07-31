module randora_engine.engine_app.engine_app;

import randora_engine.engine_app;

class EngineApp(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	public bool						quit	= false;
	public SDLSDL!(typeof(this))	sdl		= null;
	
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
	}
	
	override void on_init(){
		this.sdl.init();
		super.on_init();
	}
	
	override void on_load(){
		super.on_load();
		this.sdl.load();
	}
	
	override void pre_start(){
		super.pre_start();
		this.sdl.start();
	}
	
	override void on_start(){
		super.on_start();
		
		this.init();
		this.update();
		this.load();
		this.update();
	}
}
