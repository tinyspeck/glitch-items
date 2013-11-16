frame_padd = 40; // due to filters in use on sping anims

//if (!animatee) animatee = letterBlock_mc;
animations = ['idle_stand', 'hover_takeoff', 'hover', 'spin_out' ,'spin' , 'spin_in' , 'hover_land'];
loopers = ['hover' ,'spin'];

var item_inited:Boolean;
var item_ran:Boolean;

var config_options:Object = {
	variant: [
		"A",
		"B",
		"E",
		"M",
		"S",
		"T"
	]
}

if (!item_inited) itemInit();

function itemInit():void {
	myAnim = 'idle_stand';
	animatee = letterBlock_mc.getChildAt(0) as MovieClip;
	item_inited = true;
}

//itemRun()
function itemRun():void {
	if (item_ran) return;
	//do_trace = true
	// DEFAULT!
	//var temp_ob4:Object = {
	//	variant: 'E'
	//}
	
	//initializehead(temp_ob4);
	//stopAll();
	trackFrames();
	//playAnimation('hover');
	//playAnimationSeq(['idle']);
	item_ran = true;
	//LogCoords(animatee, 20)
	
}

function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	animatee = addArticleToContainer('letterBlock'+ob.variant, this, 'letterBlock_mc') || animatee;
}


