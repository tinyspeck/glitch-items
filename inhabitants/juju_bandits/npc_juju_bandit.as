var config_options:Object = {
	variant: ['red', 'green', 'yellow'],
	bandana: ['blue', 'black', 'red', 'none']
}

animatee = juju_mc;
animated_mcs = ['holder', 'face', 'hand_right', 'hand_left'];
animations = ['iconic','spawn', 'walk', 'walk_end', 'idle1', 'idle2', 'shrink', 'swipe'];
loopers = ['walk', 'idle1', 'idle2'];
loop_froms = {'walk': 8}

var item_inited:Boolean;
var item_ran:Boolean;
var holder:MovieClip;
var face:MovieClip;
var hand_right:MovieClip;
var hand_left:MovieClip;

if (!item_inited) itemInit();

function itemInit():void {
	myAnim = 'idle1';
	holder = animatee.JuJuAnimation_mc;
	face = holder.faceContainer_mc.getChildAt(0);
	hand_left = holder.handLeftContainer_mc.getChildAt(0);
	hand_right = holder.handRightContainer_mc.getChildAt(0);
	item_inited = true;
}

//do_trace = true;
//itemRun()
function itemRun():void {
	if (item_ran) return;
	
	// DEFAULT!
	var temp_ob4:Object = {
		variant: 'green',
		bandana: 'red'
	}
	
	//initializehead(temp_ob4);
	//stopAll();
	trackFrames();
	//playAnimation('walk');
	//playAnimationSeq(['open', 'close', 'idle_move', 'idle_hold', 'turn', 'talk', 'idle_hold']);
	item_ran = true;
	//LogCoords(animatee, 20)
	
}

function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	addArticleToContainer(correctObValue('_Body', ob.variant), holder, 'bodyContainer_mc');
	face = addArticleToContainer(correctObValue('_face', ob.variant), holder, 'faceContainer_mc');
	addArticleToContainer(correctObValue('_arm_left', ob.variant), holder, 'armLeftContainer_mc');
	addArticleToContainer(correctObValue('_arm_right', ob.variant), holder, 'armRightContainer_mc');
	hand_left = addArticleToContainer(correctObValue('_hand_left', ob.variant), holder, 'handLeftContainer_mc');
	hand_right = addArticleToContainer(correctObValue('_hand_right', ob.variant), holder, 'handRightContainer_mc');
	addArticleToContainer(correctObValue('_leg_left', ob.variant), holder, 'legRightContainer_mc');
	addArticleToContainer(correctObValue('_leg_right', ob.variant), holder, 'legLeftContainer_mc');
	addArticleToContainer(correctObValue('_bandana', ob.bandana), holder, 'bandanaContainer_mc');
}

function correctObValue(suf:String, val:String):String {
	if (!val) return 'none';
	if (val.toLowerCase() == 'none') return 'none';
	return val+suf;
}

