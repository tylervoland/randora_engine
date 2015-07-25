module container.screen.screen;

import container.screen;
class RNDScreen(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	this(Master master){
		super(master);
	}
}
