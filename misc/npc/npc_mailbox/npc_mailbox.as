var item_inited:Boolean;
var item_ran:Boolean;
var box:MovieClip;
var config_options:Object;

itemInit();

function itemInit():void {
	if (item_inited) return;
	animatee = this;
	animated_mcs = ['box'];
	animations = ['idle', 'has_mail', 'interact', 'all_done'];
	loopers = ['idle', 'has_mail'];
	myAnim = 'idle';
	
	config_options = {
		variant: [
			'mailboxRight',
			'mailboxLeft'
		]
	}
	
	box = mailboxContainer_mc.getChildAt(0) as MovieClip;
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
	box = addArticleToContainer(ob.variant, this, 'mailboxContainer_mc') || box;
}


