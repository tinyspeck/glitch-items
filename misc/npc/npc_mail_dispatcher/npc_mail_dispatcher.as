var item_inited:Boolean;
var item_ran:Boolean;
var box:MovieClip;
var config_options:Object;

itemInit();

function itemInit():void {
	if (item_inited) return;
	animatee = this;
	animated_mcs = ['box'];
	animations = ['idle', 'interact', 'prepare_package', 'waiting_for_frog', 'package_sent', 'cancel'];
	loopers = ['idle', 'waiting_for_frog'];
	myAnim = 'idle';
	
	config_options = {
		variant: [
			'dispatcherRight',
			'dispatcherLeft'
		]
	}
	
	box = dispatcherContainer_mc.getChildAt(0) as MovieClip;
	item_inited = true;
}

//itemRun()
function itemRun():void {
	if (item_ran) return;
	//do_trace = true
	// DEFAULT!
	var temp_ob4:Object = {
		variant: 'dispatcherLeft'
	}
	
	//initializehead(temp_ob4);
	//stopAll();
	//trackFrames();
	//playAnimation('warriorPose');
	//playAnimationSeq(['idle']);
	item_ran = true;
	//LogCoords(animatee, 20)
	
}



function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	box = addArticleToContainer(ob.variant, this, 'dispatcherContainer_mc') || box;
}


