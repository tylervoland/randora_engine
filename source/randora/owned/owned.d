module randora.owned.owned;

import randora.owned;
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
		//import container.base_app;
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
