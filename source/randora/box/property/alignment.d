module randora_engine.box.property.alignment;

import randora_engine.box.property;
class RNDAlignment(Master) : RNDOwned!(Master){
	@property{
		enum ALIGNMENT{
			NULL,
			NONE,
			BOTTOM,
			LEFT,
			CENTER,
			TOP,
			RIGHT,
			INHERIT
		}
		
		int x = this.ALIGNMENT.NONE;
		int y = this.ALIGNMENT.NONE;
	}
	
	this(Master master){
		super(master);
		this.type = "RNDAlignment";
		this.name = "alignment";
		this.x = this.ALIGNMENT.NONE;
		this.y = this.ALIGNMENT.NONE;
	}
	
	public override void on_update(){
		super.on_update();
		this.update_x();
		this.update_y();
	}
	
	void update_x(){
		if(this.x == this.ALIGNMENT.BOTTOM){
			this.x = this.ALIGNMENT.LEFT;
		}
		
		if(this.x == this.ALIGNMENT.TOP){
			this.x = this.ALIGNMENT.RIGHT;
		}
		
		switch(this.x){
			case this.ALIGNMENT.BOTTOM:
				this.left();
				break;
			case this.ALIGNMENT.CENTER:
				this.center_x();
				break;
			case this.ALIGNMENT.INHERIT:
				this.inherit_x();
				break;
			case this.ALIGNMENT.LEFT:
				this.left();
				break;
			case this.ALIGNMENT.NONE:
				this.none_x();
				break;
			case this.ALIGNMENT.NULL:
				break;
			case this.ALIGNMENT.RIGHT:
				this.right();
				break;
			case this.ALIGNMENT.TOP:
				this.right();
				break;
			default:
				assert(false, "alignment.x has no value");
				//break;
		}
	}
	
	void update_y(){
		if(this.y == this.ALIGNMENT.LEFT){
			this.y = this.ALIGNMENT.BOTTOM;
		}
		
		if(this.y == this.ALIGNMENT.RIGHT){
			this.y = this.ALIGNMENT.TOP;
		}
		
		switch(this.y){
			case this.ALIGNMENT.BOTTOM:
				this.bottom();
				break;
			case this.ALIGNMENT.CENTER:
				this.center_y();
				break;
			case this.ALIGNMENT.INHERIT:
				this.inherit_y();
				break;
			case this.ALIGNMENT.LEFT:
				this.bottom();
				break;
			case this.ALIGNMENT.NONE:
				this.none_y();
				break;
			case this.ALIGNMENT.NULL:
				break;
			case this.ALIGNMENT.RIGHT:
				this.top();
				break;
			case this.ALIGNMENT.TOP:
				this.top();
				break;
			default:
				assert(false, "alignment.y has no value");
				//break;
		}
	}
	
	public void bottom(){
		if(this.grandmaster !is null){
			this.master.position.y = this.grandmaster.contents.dy + this.grandmaster.contents.py - this.master.dimension.y;
		}
	}
	
	public void center_x(){
		if(this.grandmaster !is null){
			this.master.position.x = this.grandmaster.contents.dx / 2 - this.master.dimension.x / 2;
		}
	}
	
	public void center_y(){
		if(this.grandmaster !is null){
			this.master.position.y = this.grandmaster.contents.dy / 2 - this.master.dimension.y / 2;
		}
	}
	
	public void left(){
		if(this.grandmaster !is null){
			this.master.position.x = this.grandmaster.contents.px;
		}
	}
	
	public void right(){
		if(this.grandmaster !is null){
			this.master.position.x = this.grandmaster.contents.dx + this.grandmaster.contents.px - this.master.dimension.x;
		}
	}
	
	public void top(){
		if(this.grandmaster !is null){
			this.master.position.y = this.grandmaster.contents.py;
		}
	}
	
	public void inherit_x(){}
	public void inherit_y(){}
	public void none_x(){}
	public void none_y(){}
	
	override string on_print(int level = 0){
		import std.conv;
		string s;
		
		s ~= this.indent(level+1);
		s ~= "\"x\" :\t";
		s ~= to!(string)(this.x);
		s ~= ",\n";
		
		s ~= this.indent(level+1);
		s ~= "\"y\" :\t";
		s ~= to!(string)(this.y);
		s ~= ",\n";
		
		s ~= super.on_print(level);
		return s;
	}
	
}
