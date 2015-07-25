module resource.font.font;

import resource;
class RNDFont(Master) : RNDBaseTexture!(Master){
	this(Master master, string text){
		super(master, "/usr/share/fonts/truetype/ubuntu-font-family/", "UbuntuMono-R.ttf");
		this.text = text;
	}
	
	~this(){
		SDL_DestroyTexture(this.sdl_texture);
		this.sdl_texture = null;
	}
	
	@property{
		import derelict.sdl2.ttf;
		private TTF_Font* _font = null;
		public ref TTF_Font* font(){ return this._font; }
	}
	
	@property{
		private int _size = 12;
		public ref int size(){ return this._size; }
	}
	
	@property{
		private string _text = "";
		public ref string text(){ return this._text; }
		public const(char)* const_char_text(){
			import std.string;
			const(char)* _t = std.string.toStringz(this._text);
			return _t;
		}
	}
	
	override void on_init(){
		super.on_init();
		
		this.color.red		= 0xFF;
		this.color.green	= 0xFF;
		this.color.blue		= 0xFF;
		this.color.alpha	= 0xFF;
		
		this.color_key.red		= 0x00;
		this.color_key.green	= 0x00;
		this.color_key.blue		= 0x00;
		this.color_key.active	= true;
	}
	
	override void on_load(){
		super.on_load();
		
		this.font = TTF_OpenFont(this.const_char_path, this.size * 2);
		assert(this.font != null);//TTF_GetError());
		
		this.sdl_surface = TTF_RenderText_Solid(
			this.font,
			this.const_char_text,
			this.color
		);
		
		/+
		this.box.dimension.x = cast(int)(this.size * this.text.length);
		this.box.dimension.y = cast(int)(this.size);
		this.box.margin.spacing = 0;
		+/
		this.master.dimension.x = cast(int)(this.size * this.text.length);
		this.master.dimension.y = cast(int)(this.size);
		this.master.margin.spacing = 0;
	}
}
