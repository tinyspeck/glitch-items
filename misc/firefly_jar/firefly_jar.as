animatee = jar;
animated_mcs = ['flies'];
animations = ['closed', 'open', 'opening', 'closing'];
loopers = ['open', 'closed'];

var item_inited:Boolean;
var item_ran:Boolean;
var flies:MovieClip;

var config_options:Object = {
	num_flies: [
		"0",
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7"
	]
}

do_trace = false;


if (!item_inited) itemInit();

function itemInit():void {
	myAnim = 'closed';
	flies = jar.firefliesContainer_mc.getChildAt(0);
	//flies.x = 20;
	item_inited = true;
}

//itemRun()
function itemRun():void {
	if (item_ran) return;
	
	// DEFAULT!
	var temp_ob4:Object = {
		num_flies: '7'
	}
	
	//initializehead(temp_ob4);
	//stopAll();
	trackFrames();
	//playAnimation('closed');
	//playAnimationSeq(['open', 'close', 'idle_move', 'idle_hold', 'turn', 'talk', 'idle_hold']);
	item_ran = true;
	//LogCoords(animatee, 20)
	
}



function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	flies = addArticleToContainer('flies_'+ob.num_flies, jar, 'firefliesContainer_mc') || flies;
}

