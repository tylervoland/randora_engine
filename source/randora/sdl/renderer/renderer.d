module randora.sdl.renderer.renderer;

import randora.sdl.renderer;
class SDLRenderer(Master) : RNDOwned!(Master){
	alias sdl_renderer this;
	public SDL_Renderer* sdl_renderer = null;
	
	public uint	flags	=  0;
	public int	index	= -1;
	
	this(Master master){
		super(master);
		this.flags |= SDL_RENDERER_ACCELERATED;
		this.flags |= SDL_RENDERER_PRESENTVSYNC;
	}
	
	override void on_start(){
		super.on_start();
		
		this.sdl_renderer = SDL_CreateRenderer(this.master, index, flags);
		assert(this.sdl_renderer !is null);//SDL_GetError()
	}
	
	override void on_init(){
		super.on_init();
		
		SDL_SetRenderDrawBlendMode(
			this.sdl_renderer,
			SDL_BLENDMODE_BLEND
		);
		
		this.draw_color();
	}
	
	void clear(){
		SDL_RenderClear(this.sdl_renderer);
	}
	
	override void on_render(){
		super.on_render();
		SDL_RenderPresent(this.sdl_renderer);
	}
	
	void draw_color(ubyte c1 = 0xFF, ubyte c2 = 0xFF, ubyte c3 = 0xFF, ubyte c4 = 0xFF){
		SDL_SetRenderDrawColor(
			this.sdl_renderer,
			c1, c2, c3, c4,
		);
	}
}
