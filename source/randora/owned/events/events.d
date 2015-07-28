module randora.owned.events.events;

import randora.owned.events;
class RNDEvents(Master) : RNDOwned!(Master){
	this(Master master){
		super(master);
		this.key_down = new RNDKeyboardEvent!(typeof(this))(this);
		//this.key_up				= new RNDKeyboardEvent!(typeof(this))(this);
		//this.mouse_button_down	= new RNDMouseButtonEvent!(typeof(this))(this);
		//this.mouse_button_up		= new RNDMouseButtonEvent!(typeof(this))(this);
	}
	
	@property{
		import derelict.sdl2.sdl;
		import derelict.sdl2.types;
		public SDL_Event event;
	}
	
	@property{
		//import owned.keyboard_event;
		private RNDKeyboardEvent!(typeof(this)) _key_down = null;
		public ref RNDKeyboardEvent!(typeof(this)) key_down(){ return this._key_down; }
	}
	
	override void on_init(){
		super.on_init();
	}
	
	void poll(){
		while(SDL_PollEvent(&this.event) != 0){
			//this.check();
			this.key_down.check();
		}
	}
}
