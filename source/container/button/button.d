module rnd.container.button.button;

import rnd.container.button;
class RNDButton(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	this(Master master){
		this.type = "button";
		super(master);
	}
}
