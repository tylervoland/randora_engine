module randora.box.property.spacing;

import randora.box.property;
mixin template RNDSpacing(ObjectType){
	@property{
		private int _spacing = 0;
		public ref int spacing(){ return this._spacing; }
	}
}
