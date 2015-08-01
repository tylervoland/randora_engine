module randora.engine.owned.owned;

import randora.engine.owned;
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
		//TODO: Fix this so it doesn't rely on importing from game.app
		import game.app;
		public ref App app(){
			return this.master.app;
		}
	}
	/+
	@property{
		import randora_ui.window;
		public ref auto window(){
			return this.master.window;
		}
	}
	+/
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
