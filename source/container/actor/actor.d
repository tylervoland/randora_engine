module rnd.container.actor.actor;

import rnd.container.actor;
class RNDActor(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	this(Master master){
		super(master);
	}
}
