module randora_engine.math.point.point;

import randora_engine.math.point;
class RNDPoint(Master) : RNDOwned!(Master){
	this(Master master, int ix = 0, int iy = 0, int iz = 0){
		super(master);
		this.type = "RNDPoint";
		this.name = "point";
		this.x = ix;
		this.y = iy;
		this.z = iz;
	}
	
	//bool modified = true;
	
	@property{
		public int _x = 0;
		public int x(){
			return this._x;
		}
		public int x(int ix){
			this._x = ix;
			return this._x;
		}
	}
	
	@property{
		public int _y = 0;
		public int y(){
			return this._y;
		}
		public int y(int iy){
			this._y = iy;
			return this._y;
		}
	}
	
	@property{
		public int _z = 0;
		public int z(){
			return this._z;
		}
		public int z(int iz){
			this._z = iz;
			return this._z;
		}
	}
	
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
		
		s ~= this.indent(level+1);
		s ~= "\"z\" :\t";
		s ~= to!(string)(this.z);
		s ~= "\n";
		
		//TODO: BUG: Find out why this crashes
		//s ~= this.on_print(level);
		return s;
	}
}

