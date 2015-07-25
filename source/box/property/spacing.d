module rnd.box.property.spacing;

import rnd.box.property;
mixin template RNDSpacing(ObjectType){
	@property{
		private int _spacing = 0;
		public ref int spacing(){ return this._spacing; }
	}
}
