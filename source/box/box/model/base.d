module box.box.model.base;

import box.box.model;
class RNDBoxModelBase(Master) : RNDOwned!(Master){
	public RNDColor!(typeof(this))	color	= null;
	public SDL_Rect						rect;
	public int							spacing	= 0;
	
	this(Master master){
		super(master);
		this.type = "RNDRecture";
		this.name = "recture";
		
		this.color = new RNDColor!(typeof(this))(this);
		//this.add_member(this.color);
	}
	
	@property{
		int dx(){ return 0; }
		int dy(){ return 0; }
		int px(){ return 0; }
		int py(){ return 0; }
	}
	
	override void pre_draw(){
		this.color.draw();
		super.pre_draw();
	}
	
	override string on_print(int level = 0){
		import std.conv;
		string s;
		s ~= this.indent(level+1);
		s ~= "\"spacing\" :\t";
		s ~= to!(string)(this.spacing);
		s ~= ",\n";
		
		s ~= this.indent(level+1);
		s ~= "\"px\" :\t";
		s ~= to!(string)(this.px);
		s ~= ",\n";
		
		s ~= this.indent(level+1);
		s ~= "\"py\" :\t";
		s ~= to!(string)(this.dy);
		s ~= ",\n";
		
		s ~= this.indent(level+1);
		s ~= "\"dx\" :\t";
		s ~= to!(string)(this.dx);
		s ~= ",\n";
		
		s ~= this.indent(level+1);
		s ~= "\"dy\" :\t";
		s ~= to!(string)(this.dy);
		s ~= ",\n";
		
		s ~= this.color.print(level);
		s ~= ",\n";
		
		s ~= super.on_print(level);
		return s;
	}
}
