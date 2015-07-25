module rnd.box.image.model.border;

import rnd.box.image.model;
class RNDImageModelBorder(Master) : RNDBoxModelBorder!(Master){
	public RNDImageModelPadding!(typeof(this)) padding = null;
	
	this(Master master, string directory, string file){
		super(master);
		this.padding = new RNDImageModelPadding!(typeof(this))(this, directory, file);
		this.add_member(this.padding);
	}
}
