//if (!animatee) animatee = squid_mc;
animations = ['idle', 'attract', 'talk', 'bamfIn', 'bamfOut', 'move'];
loopers = ['idle', 'move'];

var item_inited:Boolean;
var item_ran:Boolean;

var config_options:Object = {
	variant: [
		"squidPurple",
		"squidRed",
		"squidGreen",
		"squidBlue",
		"squidYellow"
	]
}

if (!item_inited) itemInit();

function itemInit():void {
	myAnim = 'idle';
	animatee = squid_mc.getChildAt(0) as MovieClip;
	item_inited = true;
}

itemRun()
function itemRun():void {
	if (item_ran) return;
	do_trace = true
	// DEFAULT!
	var temp_ob4:Object = {
		variant: 'squidRed'
	}
	
	//initializehead(temp_ob4);
	//stopAll();
	trackFrames();
	//playAnimation('move');
	//playAnimationSeq(['idle']);
	item_ran = true;
	//LogCoords(animatee, 20)
	
}



function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	animatee = addArticleToContainer(ob.variant, this, 'squid_mc') || animatee;
}


