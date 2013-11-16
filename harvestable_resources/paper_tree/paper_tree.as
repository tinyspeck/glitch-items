animatee = this;
animations = ['1'];
loopers = [];

var tree_mcs:Array = ['normal','needs_pet','needs_water','needs_pet_and_water'];

var config_options:Object = {
	paper_count: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21],
	needs_water: [true, false],
	needs_pet: [true, false]
}

var item_inited:Boolean;
var item_ran:Boolean;

if (!item_inited) itemInit();

function itemInit():void {
	myAnim = '1';
	for (var i:int;i<tree_mcs.length;i++) {
		if (this[tree_mcs[i]]) this[tree_mcs[i]].stop();
	}
	stopAll();
	item_inited = true;
}

//itemRun()
function itemRun():void {
	if (item_ran) return;
	
	// DEFAULT!
	var temp_ob4:Object = {
		needs_water: true,
		needs_pet: true,
		paper_count: 21
	}
	
	initializehead(temp_ob4);
	trackFrames();
	playAnimation(myAnim);
	item_ran = true;
}

function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	
	for (var i:int;i<tree_mcs.length;i++) {
		if (this[tree_mcs[i]] && this[tree_mcs[i]].parent) this[tree_mcs[i]].parent.removeChild(this[tree_mcs[i]]);	
	}
	
	var mc:MovieClip = normal;
	var needs_water_val = (ob.hasOwnProperty('needs_water') && (ob.needs_water === true || ob.needs_water === 1 || String(ob.needs_water).toLowerCase() === 'true')) ? true : false;
	var needs_pet_val = (ob.hasOwnProperty('needs_pet') && (ob.needs_pet === true || ob.needs_pet === 1 || String(ob.needs_pet).toLowerCase() === 'true')) ? true : false;
	
	if (needs_water_val && needs_pet_val) {
		mc = needs_pet_and_water;
	} else if (needs_water_val) {
		mc = needs_water;
	} else if (needs_pet_val) {
		mc = needs_pet;
	}
	
	if (!mc) return; 
	
	mc.gotoAndStop((parseInt(ob.paper_count) || 0)+1);
	
	this.addChild(mc);
	
	//LogCoords(this, 20);
	
}