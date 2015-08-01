module randora.engine.math.color.color;

import randora.engine.math.color;
class RNDColor(Master) : RNDOwned!(Master){
	this(Master master){
		super(master);
		this.type = "RNDColor";
		this.name = "color";
	}
	
	@property{
		alias sdl_color this;
		import derelict.sdl2.sdl;
		private SDL_Color _sdl_color = {0x00, 0x00, 0x00};
		public ref SDL_Color sdl_color(){ return this._sdl_color; }
	}
	
	@property{
		private bool _active = false;
		public ref bool active(){ return this._active; }
	}
	
	@property{
		private ubyte _alpha = 0x00;
		public ref ubyte alpha(){ return this._alpha; }
		public ref ubyte alpha(ubyte a){
			this._alpha = a;
			return this.alpha;
		}
	}
	
	@property{
		private ubyte _blue = 0x00;
		public ref ubyte blue(){ return this._blue; }
		public ref ubyte blue(ubyte b){
			this._blue = b;
			return this.blue;
		}
	}
	
	@property{
		private ubyte _green = 0x00;
		public ref ubyte green(){ return this._green; }
		public ref ubyte green(ubyte g){
			this._green = g;
			return this.green;
		}
	}
	
	@property{
		private ubyte _red = 0x00;
		public ref ubyte red(){ return this._red; }
		public ref ubyte red(ubyte r){
			this._red = r;
			return this.red;
		}
	}
	
	override void on_draw(){
		super.on_draw();
		SDL_SetRenderDrawColor(
			this.app.main_window.renderer,
			this.red,
			this.green,
			this.blue,
			this.alpha
		);
	}
	
	override string on_print(int level = 0){
		import std.conv;
		string s;
		s ~= this.indent(level+1);
		s ~= "\"red\" :\t";
		s ~= to!(string)(this.red);
		s ~= ",\n";
		
		s ~= this.indent(level+1);
		s ~= "\"green\" :\t";
		s ~= to!(string)(this.green);
		s ~= ",\n";
		
		s ~= this.indent(level+1);
		s ~= "\"blue\" :\t";
		s ~= to!(string)(this.blue);
		s ~= ",\n";
		
		s ~= this.indent(level+1);
		s ~= "\"alpha\" :\t";
		s ~= to!(string)(this.alpha);
		s ~= ",\n";
		
		s ~= super.on_print(level);
		return s;
	}
	
}
