module randora.container.button.button;

import randora.container.button;
class RNDButton(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	this(Master master){
		this.type = "button";
		super(master);
	}
}
