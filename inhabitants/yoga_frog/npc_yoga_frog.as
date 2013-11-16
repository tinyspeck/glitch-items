var item_inited:Boolean;
var item_ran:Boolean;
var frog:MovieClip;
var box:MovieClip;
var config_options:Object;

itemInit();

function itemInit():void {
	if (item_inited) return;
	animatee = this;
	animated_mcs = ['frog', 'box'];
	animations = ['iconic','idle', 'moveStart', 'move', 'moveEnd', 'talk', 'treePoseIn', 'treePose', 'treePoseOut', 'dancerPoseIn', 'dancerPose', 'dancerPoseOut', 'warriorPoseIn', 'warriorPose', 'warriorPoseOut'];
	loopers = ['idle', 'move', 'talk', 'treePose', 'dancerPose', 'warriorPose'];
	myAnim = 'idle';
	
	config_options = {
		variant: [
			'frogBlue',
			'frogRed'
		],
		box: [
			'box',
			'none'
		]
	}
	
	box = boxContainer_mc.getChildAt(0) as MovieClip;
	frog = namasteFrogContainer_mc.getChildAt(0) as MovieClip;
	item_inited = true;
}

//itemRun()
function itemRun():void {
	if (item_ran) return;
	//do_trace = true
	// DEFAULT!
	var temp_ob4:Object = {
		variant: 'frogRed',
		box: 'box'
	}
	
	//initializehead(temp_ob4);
	//stopAll();
	trackFrames();
	//playAnimation('warriorPose');
	//playAnimationSeq(['idle']);
	item_ran = true;
	//LogCoords(animatee, 20)
	
}



function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	box = addArticleToContainer(ob.box, this, 'boxContainer_mc') || box;
	frog = addArticleToContainer(ob.variant, this, 'namasteFrogContainer_mc') || frog;
}



