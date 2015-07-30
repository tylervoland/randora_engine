module randora.container.window.window;

import randora.container.window;
class RNDWindow(Master) : RNDContainer!(Master, RNDWindow){
	public RNDRenderer!(typeof(this))	renderer	= null;
	public SDL_Window* 					sdl_window	= null;
	alias sdl_window this;
	
	int flags = 0;
	
	this(Master master, int position_x = 100, int position_y = 100, int dimension_x = 640, int dimension_y = 480){
		super(master);
		this.renderer = new RNDRenderer!(typeof(this))(this);
		assert(this.renderer !is null);
		
		this.position.x		= position_x;
		this.position.y		= position_y;
		this.dimension.x	= dimension_x;
		this.dimension.y	= dimension_y;
		
		this.flags |= SDL_WINDOW_ALLOW_HIGHDPI;
		//this.flags |= SDL_WINDOW_BORDERLESS;
		//this.flags |= SDL_WINDOW_FULLSCREEN;
		//this.flags |= SDL_WINDOW_FULLSCREEN_DESKTOP;
		//this.flags |= SDL_WINDOW_HIDDEN;
		//this.flags |= SDL_WINDOW_INPUT_GRABBED;
		//this.flags |= SDL_WINDOW_MAXIMIZED;
		//this.flags |= SDL_WINDOW_MINIMIZED;
		this.flags |= SDL_WINDOW_OPENGL;
		//this.flags |= SDL_WINDOW_RESIZABLE;
		this.flags |= SDL_WINDOW_SHOWN;
	}
	
	@property{
		import derelict.sdl2.sdl;
		private SDL_Surface* _screen_surface = null;
		public ref SDL_Surface* screen_surface(){ return this._screen_surface; }
	}
	
	@property{
		private string _title = "";
		public ref string title(){ return this._title; }
		public const(char)* const_char_title(){
			import std.string;
			return std.string.toStringz(this.title);
		}
	}
	
	override void on_event(){
		super.on_event();
		this.events.poll();
	}
	
	override void on_init(){
		super.on_init();
		
		this.title = "Title";
		this.drawable = false;
		
		this.sdl_window = SDL_CreateWindow(
			this.const_char_title,
			this.position.x,
			this.position.y,
			this.dimension.x,
			this.dimension.y,
			this.flags
		);
		
		assert(this.sdl_window !is null);//SDL_GetError()
		
		this.screen_surface = SDL_GetWindowSurface(this.sdl_window);
		assert(this.screen_surface != null);
		
		this.renderer.init();
	}
	
	override void post_draw(){
		super.post_draw();
		this.renderer.draw();
	}
	
	override void on_clean(){
		super.on_clean();
		this.renderer.clean();
	}
	
	void render(){
		this.renderer.render();
	}
}
