module randora.container.screen.screen;

import randora.container.screen;
class RNDScreen(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	this(Master master){
		super(master);
	}
}
