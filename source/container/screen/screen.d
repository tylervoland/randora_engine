module rnd.container.screen.screen;

import rnd.container.screen;
class RNDScreen(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	this(Master master){
		super(master);
	}
}
