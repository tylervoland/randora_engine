module container.menu_item.menu_item;

import container.menu_item;
class RNDMenuItem(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	this(Master master){
		super(master);
		//this.font = new RNDFont!(RNDMenuItem)(this, this.title);
	}
	
	this(Master master, string title){
		this.title = title;
		this(master);
	}
	/+
	@property{
		import resource.font;
		private RNDFont!(RNDMenuItem) _font = null;
		public ref RNDFont!(RNDMenuItem) font(){ return this._font; }
	}
	+/
	@property{
		private string _icon = "";
		public ref string icon(){ return this._icon; }
	}
	
	@property{
		private string _title = "";
		public ref string title(){ return this._title; }
	}
	
	override void on_init(){
		super.on_init();
		//this.font.init();
	}
	
	override void on_load(){
		super.on_load();
		
		//this.font.load();
		
		this.stretch.x = this.stretch.STRETCH.NONE;
		this.stretch.y = this.stretch.STRETCH.NONE;
	}
	
	override void on_loop(){
		super.on_loop();
		//this.font.loop();
	}
	
	override void on_draw(){
		super.on_draw();
		//this.font.draw();
	}
	
	override void on_clean(){
		super.on_clean();
		//this.font.clean();
	}
	
	override void on_update(){
		super.on_update();
		//if(this.font !is null){
		//	this.font.update();
		//}
	}
}
