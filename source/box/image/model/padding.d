module box.image.model.padding;

import box.image.model;
class RNDImageModelPadding(Master) : RNDBoxModelPadding!(Master){
	public RNDImageModelContents!(typeof(this)) contents = null;
	
	this(Master master, string directory, string file){
		super(master);
		this.contents = new RNDImageModelContents!(typeof(this))(this, directory, file);
		this.add_member(this.contents);
	}
}
