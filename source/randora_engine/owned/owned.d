module randora_engine.owned.owned;

import randora_engine.owned;
class RNDOwned(Master) : RNDObject{
	this(Master master){
		super();
		this.master = master;
	}
	
	@property{
		private Master _master = null;
		public ref Master master(){
			return this._master;
		}
	}
	
	@property{
		import game.app;
		public ref App root(){
			return this.master.root;
		}
	}
	
	@property{
		public auto grandmaster(){
			if(this.master.master !is null){
				return this.master.master;
			}else{
				return null;
			}
		}
	}
}
