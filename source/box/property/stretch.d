module rnd.box.property.stretch;

import rnd.box.property;
class RNDStretch(Master) : RNDOwned!(Master){
	@property{
		enum STRETCH{
			NULL	= -2,
			SHRINK	= -1,
			NONE	=  0,
			EXPAND	=  1,
			HALF	=  2,
			THIRD	=  3,
			FOURTH	=  4,
			INHERIT	=  5
		}
		
		int x = this.STRETCH.EXPAND;
		int y = this.STRETCH.EXPAND;
	}
	
	this(Master master){
		super(master);
		this.type = "RNDStretch";
		this.name = "stretch";
		this.x = this.STRETCH.EXPAND;
		this.y = this.STRETCH.EXPAND;
	}
	
	override void on_update(){
		super.on_update();
		this.update_x();
		this.update_y();
	}
	
	void update_x(){
		switch(this.x){
			case this.STRETCH.EXPAND:
				this.fraction_x(1);
				break;
			case this.STRETCH.SHRINK:
				//this.shrink_x();
				break;
			case this.STRETCH.NONE:
				this.none_x();
				break;
			case this.STRETCH.HALF:
				this.fraction_x(.5);
				break;
			case this.STRETCH.THIRD:
				this.fraction_x(.33333);
				break;
			case this.STRETCH.FOURTH:
				this.fraction_x(.25);
				break;
			default:
				assert(false, "stretch.x has no value");
				//break;
		}
	}
	
	void update_y(){
		switch(this.y){
			case this.STRETCH.EXPAND:
				this.fraction_y(1);
				break;
			case this.STRETCH.SHRINK:
				//this.shrink_y();
				break;
			case this.STRETCH.NONE:
				this.none_y();
				break;
			case this.STRETCH.HALF:
				this.fraction_y(.5);
				break;
			case this.STRETCH.THIRD:
				this.fraction_y(.33333);
				break;
			case this.STRETCH.FOURTH:
				this.fraction_y(.25);
				break;
			default:
				assert(false, "stretch.y has no value");
				//break;
		}
	}
	
	public void fraction_x(float fraction = 1){
		if(this.grandmaster !is null){
			this.master.dimension.x = cast(int)((this.grandmaster.contents.dx * fraction) * this.master.scale);
		}
	}
	
	public void fraction_y(float fraction = 1){
		if(this.grandmaster !is null){
			this.master.dimension.y = cast(int)((this.grandmaster.contents.dy * fraction) * this.master.scale);
		}
	}
	
	public void none_x(){
		if(this.grandmaster !is null){
			this.master.dimension.x = cast(int)(this.master.dimension.x * this.master.scale);
		}
	}
	
	public void none_y(){
		if(this.grandmaster !is null){
			this.master.dimension.y = cast(int)(this.master.dimension.y * this.master.scale);
		}
	}
	
}
