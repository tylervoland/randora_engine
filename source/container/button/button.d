module container.button.button;

import container.button;
class RNDButton(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	this(Master master){
		this.type = "button";
		super(master);
	}
}
