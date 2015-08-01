module randora.engine.app.app;

import randora.engine.app;
class RNDApp(Master, AppType) : RNDContainer!(Master, AppType){
	public bool						quit	= false;
	public SDLSDL!(typeof(this))	sdl		= null;
	
	this(Master master = null){
		super(master);
		
		this.type = "BaseApp";
		this.name = "base_app";
		
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
	
	override void post_start(){
		super.post_start();
		this.init();
		this.update();
		this.load();
		this.update();
	}
	
	void game_loop(){
		while(!quit){
			this.event();
			this.loop();
			this.draw();
			this.render();
			this.clean();
			this.update();
		}
	}
}
