module container.context_menu.context_menu;

import container.context_menu;
class RNDContextMenu(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	this(Master master){
		super(master);
	}
	
	@property{
		import container.menu_item;
		private RNDMenuItem!(Master, ObjectType) _active_item = null;
		public RNDMenuItem!(Master, ObjectType) active_item(RNDMenuItem!(Master, ObjectType) menu_item){
			return this._active_item;
		}
		public RNDMenuItem!(Master, ObjectType) active_item(){
			if(this.menu_items.length == 0){
				throw new Exception("Menu.active() No menu_items in menu");
			}
			return this._menu_items[this.iterator];
		}
	}
	
	@property{
		private long _iterator = 0;
		public long iterator(){
			long _i = this._iterator % this.menu_items.length;
			return _i;
		}
		public long iterator(long _i){ return this._iterator = _i; }
	}
	
	@property{
		import container.menu_item;
		private RNDMenuItem!(Master, ObjectType)[] _menu_items = null;
		public ref RNDMenuItem!(Master, ObjectType)[] menu_items(){ return this._menu_items; }
	}
	
	override void on_init(){
		super.on_init();
		foreach(int i, RNDMenuItem!(Master, ObjectType) menu_item; this.menu_items){
			menu_item.init();
		}
	}
	
	override void post_load(){
		super.post_load();
		foreach(int i, RNDMenuItem!(Master, ObjectType) menu_item; this.menu_items){
			//menu_item.box.position.x = 10;
			menu_item.position.x = 10;
			menu_item.load();
		}
		if(this.menu_items.length > 0){
			//this.box.dimension.y = this.menu_items[0].box.dimension.y * cast(int)this.menu_items.length;
			this.dimension.y = this.menu_items[0].dimension.y * cast(int)this.menu_items.length;
		}
		this.iterator = 0;
	}
	
	override void on_draw(){
		super.on_draw();
		foreach(int i, RNDMenuItem!(Master, ObjectType) menu_item; this.menu_items){
			menu_item.draw();
		}
	}
	
	override void on_clean(){
		super.on_clean();
		foreach(int i, RNDMenuItem!(Master, ObjectType) menu_item; this.menu_items){
			menu_item.clean();
		}
	}
	override void on_update(){
		super.on_update();
		if(this.menu_items !is null){
			foreach(int i, RNDMenuItem!(Master, ObjectType) menu_item; this.menu_items){
				menu_item.update();
			}
		}
	}
	
	void add_item(ObjectType type, string t){
		//RNDMenuItem!(Master, ObjectType) item = new RNDMenuItem!(Master, ObjectType)(type, t);
		//item.z_index = this.menu_items.length;
		//this.menu_items ~= item;
	}
}
