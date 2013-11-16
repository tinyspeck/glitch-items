animatee = this;
animations = ['1'];
loopers = [];

var piles:Array = ['dirt1','dirt2'];

var config_options:Object = {
	variant: ['dirt1', 'dirt2'],
	dirt_state: [11,10,9,8,7,6,5,4,3,2,1]
}

var item_inited:Boolean;
var item_ran:Boolean;

if (!item_inited) itemInit();

function itemInit():void {
	myAnim = '1';
	for (var i:int;i<piles.length;i++) {
		if (this[piles[i]]) this[piles[i]].stop();
	}
	stopAll();
	item_inited = true;
}

//itemRun()
function itemRun():void {
	if (item_ran) return;
	
	// DEFAULT!
	var temp_ob4:Object = {
		variant: 'dirt1',
		dirt_state: 10
	}
	
	initializehead(temp_ob4);
	trackFrames();
	playAnimation(myAnim);
	item_ran = true;
}

function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	
	for (var i:int;i<piles.length;i++) {
		if (this[piles[i]] && this[piles[i]].parent) this[piles[i]].parent.removeChild(this[piles[i]]);	
	}
	
	var mc:MovieClip = this[ob.variant] || dirt1;
	
	if (!mc) return; 
	
	mc.gotoAndStop((parseInt(ob.dirt_state) || 11));
	
	this.addChild(mc);
	
	//LogCoords(this, 20);
	
}