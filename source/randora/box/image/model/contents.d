module randora_engine.box.image.model.contents;

import randora_engine.box.image.model;
class RNDImageModelContents(Master) : RNDBoxModelContents!(Master){
	RNDTexture!(typeof(this)) image = null;
	
	this(Master master, string directory, string file){
		super(master);
		this.image = new RNDTexture!(typeof(this))(this, directory, file);
		this.add_member(this.image);
	}
	
	override void post_load(){
		super.post_load();
		int mmmmdx = this.image.width;
		mmmmdx += (this.spacing * 2);
		mmmmdx += (this.master.spacing * 2);
		mmmmdx += (this.master.master.spacing * 2);
		mmmmdx += (this.master.master.master.spacing * 2);
		this.master.master.master.master.dimension.x = mmmmdx;
		
		int mmmmdy = this.image.height;
		mmmmdy += (this.spacing * 2);
		mmmmdy += (this.master.spacing * 2);
		mmmmdy += (this.master.master.spacing * 2);
		mmmmdy += (this.master.master.master.spacing * 2);
		this.master.master.master.master.dimension.y = mmmmdy;
	}
}
