module container.layer.layer;

import container.layer;
class RNDLayer(Master, ObjectType) : RNDContainer!(Master, ObjectType){
	this(Master master){
		super(master);
	}
	/+
	@property{
		import resource.texture;
		private RNDTexture!(ObjectType)[] _backgrounds = null;
		public ref RNDTexture!(ObjectType)[] backgrounds(){ return this._backgrounds; }
	}
	+/
	override void on_load(){
		super.on_load();
	}
	/+
	override void on_render(){
		super.on_render();
		/+
		foreach(int i, RNDTexture!(ObjectType) background; this.backgrounds){
			background.render();
		}
		+/
	}
	+/
}
