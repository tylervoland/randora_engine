module randora_engine.box.property.spacing;

import randora_engine.box.property;
mixin template RNDSpacing(ObjectType){
	@property{
		private int _spacing = 0;
		public ref int spacing(){ return this._spacing; }
	}
}
