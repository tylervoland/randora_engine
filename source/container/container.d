module rnd.container.container;

import rnd.container;
class RNDContainer(Master, ObjectType) : RNDWidget!(Master){
	public RNDWidget!(ObjectType)[] slaves = null;
	
	this(Master master){
		super(master);
	}
	
	void add_slave(RNDWidget!(ObjectType) slave){
		slave.z_index = this.slaves.length;
		this.slaves ~= slave;
	}
	
	override void on_clean(){
		super.on_clean();
		foreach(int i, RNDWidget!(ObjectType) slave; this.slaves){
			slave.clean();
		}
	}
	
	override void on_draw(){
		super.on_draw();
		foreach(int i, RNDWidget!(ObjectType) slave; this.slaves){
			slave.draw();
		}
	}
	
	override void on_init(){
		super.on_init();
		foreach(int i, RNDWidget!(ObjectType) slave; this.slaves){
			slave.init();
		}
	}
	
	override void on_load(){
		super.on_load();
		foreach(int i, RNDWidget!(ObjectType) slave; this.slaves){
			slave.load();
		}
	}
	
	override void on_loop(){
		super.on_loop();
		foreach(int i, RNDWidget!(ObjectType) slave; this.slaves){
			slave.loop();
		}
	}
	
	override void on_sort(){
		super.on_sort();
		if(this.slaves !is null){
			foreach(int i, RNDWidget!(ObjectType) slave; this.slaves){
				slave.sort();
			}
		}
	}
	
	override void on_update(){
		super.on_update();
		if(this.slaves !is null){
			foreach(int i, RNDWidget!(ObjectType) slave; this.slaves){
				slave.update();
			}
		}
	}
	
	override string on_print(int level = 0){
		string s;
		foreach(int i, RNDWidget!(ObjectType) slave; this.slaves){
			s ~= slave.print(level);
			s ~= ",\n";
		}
		s ~= super.on_print(level);
		return s;
	}
}
