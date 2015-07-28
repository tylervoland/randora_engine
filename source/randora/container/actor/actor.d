module randora.container.actor.actor;

import randora.container.actor;
class RNDActor(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	this(Master master){
		super(master);
	}
}
