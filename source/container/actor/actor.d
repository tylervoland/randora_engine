module container.actor.actor;

import container.actor;
class RNDActor(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	this(Master master){
		super(master);
	}
}
