module rndobject.rndobject;

/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Authors: Master Foo
 + Bugs: None
 + Date: 2015-06-11
 + Examples:
 + -----------------------------------------------------------------------------
 + void main(){
 + 	import rndobject;
 + 	RNDObject obj = new RNDObject();
 + }
 + -----------------------------------------------------------------------------
 + Examples:
 + -----------------------------------------------------------------------------
 + void asdf(){
 + 	import rndobject;
 + 	RNDObject obj = new RNDObject();
 + }
 + -----------------------------------------------------------------------------
 + History:
 + License: CC
 + See_Also:
 + Standards:
 + Throws:
 + Version:
 + Copyright: 2015
 + Macros:
 + 	FOO =	now is the time for
 + 			all good men
 + 	BAR =	bar
 + 	MAGENTA = <font color=magenta>$(DOLLAR)0</font>
 + Escapes =	/&/AddressOf!/
 + 				/!/Exclamation/
 + 				/?/QuestionMark/
 + 				/,/Comma/
 + 				/{ }/Parens/
 + 				/<,>/Arrows/
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
import rndobject;

class RNDObject{
	mixin RNDClean;
	mixin RNDDraw;
	mixin RNDEvent;
	mixin RNDInit;
	mixin RNDLoad;
	mixin RNDLog;
	mixin RNDLoop;
	mixin RNDPrint;
	mixin RNDResize;
	mixin RNDSort;
	mixin RNDUpdate;
	
	string type = "RNDObject";
	string name = "object";
	
	RNDObject members[] = null;
	
	/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	 + this does this.
	 + Returns: void
	+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
	this(){}
	
	void add_member(RNDObject member){
		this.members ~= member;
	}
}

