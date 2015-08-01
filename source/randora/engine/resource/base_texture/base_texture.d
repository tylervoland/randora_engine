module randora.engine.resource.base_texture.base_texture;

import randora.engine.resource.base_texture;
class RNDBaseTexture(Master) : RNDOwned!(Master){
	mixin RNDResource;
	
	this(Master master, string directory, string file){
		super(master);
		this.resource_init(directory, file);
		
		this.color		= new RNDColor!(typeof(this))(this);
		this.color_key	= new RNDColor!(typeof(this))(this);
		
		this.color.red		= 0xFF;
		this.color.green	= 0xFF;
		this.color.blue		= 0xFF;
		this.color.alpha	= 0xFF;
		
		this.color_key.red		= 0xFF;
		this.color_key.green	= 0xFF;
		this.color_key.blue		= 0xFF;
		this.color_key.alpha	= 0xFF;
	}
	
	~this(){
		SDL_DestroyTexture(this.sdl_texture);
		this.sdl_texture = null;
		SDL_FreeSurface(this.sdl_surface);
		this.sdl_surface = null;
	}
	
	int height = 0;
	int width = 0;
	
	@property{
		private SDL_BlendMode _blending = 0;
		public ref SDL_BlendMode blending(){ return this._blending; }
		public ref SDL_BlendMode blending(SDL_BlendMode blending = 0){
			SDL_SetTextureBlendMode(this.sdl_texture, blending);
			return this._blending;
		}
	}
	
	@property{
		private RNDColor!(typeof(this)) _color = null;
		public ref RNDColor!(typeof(this)) color(){ return this._color; }
		public void set_color(){
			SDL_SetTextureColorMod(
				this.sdl_texture,
				this.color.red,
				this.color.green,
				this.color.blue
			);
			
			SDL_SetTextureAlphaMod(
				this.sdl_texture,
				this.color.alpha
			);
		}
	}
	
	@property{
		private RNDColor!(typeof(this)) _color_key = null;
		public ref RNDColor!(typeof(this)) color_key(){ return this._color_key; }
		void set_color_key(){
			assert(this.sdl_surface !is null);
			
			SDL_SetColorKey(
				this.sdl_surface,
				this.color_key.active,
				SDL_MapRGB(
					this.sdl_surface.format,
					this.color_key.red,
					this.color_key.green,
					this.color_key.blue
				)
			);
		}
	}
	
	@property{
		private SDL_Surface* _sdl_surface = null;
		public ref SDL_Surface* sdl_surface(){ return this._sdl_surface; }
	}
	
	@property{
		alias sdl_texture this;
		private SDL_Texture* _sdl_texture = null;
		public ref SDL_Texture* sdl_texture(){ return this._sdl_texture; }
	}
	
	override void on_init(){
		super.on_init();
		this.set_color();
	}
	
	override void post_load(){
		super.post_load();
		
		assert(this.sdl_surface !is null);//IMG_GetError()
		this.set_color_key();
		this.sdl_texture = SDL_CreateTextureFromSurface(
			this.app.main_window.renderer,
			this.sdl_surface
		);
		assert(this.sdl_texture !is null, "Failed to load texture image!");
		
		this.height = this.sdl_surface.h;
		this.width = this.sdl_surface.w;
		
		this.set_color();
		SDL_FreeSurface(this.sdl_surface);
		this.sdl_surface = null;
	}
	
	override void on_draw(){
		super.on_draw();
		
		SDL_Rect tmp_render_quad = {
			this.master.px,
			this.master.py,
			this.master.dx,
			this.master.dy
		};
		
		SDL_RenderCopy(
			this.app.main_window.renderer,
			this.sdl_texture,
			null,
			&tmp_render_quad
		);
	}
}
