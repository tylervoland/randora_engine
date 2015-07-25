module rnd.resource.texture.texture;

import rnd.resource;
class RNDTexture(Master) : RNDBaseTexture!(Master){
	this(Master master, string directory, string file){
		super(master, directory, file);
	}
	
	@property{
		alias sdl_texture this;
	}
	
	override void on_load(){
		super.on_load();
		import derelict.sdl2.image;
		this.sdl_surface = IMG_Load(this.const_char_path);
		assert(this.sdl_surface != null);
	}
}
