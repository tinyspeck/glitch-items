var config_options:Object = {
	variant: ['red', 'green'],
	head: ['1', '2']
}

animatee = smuggler_mc;
animated_mcs = ['head'];
animations = ['empty', 'arriveWithBox', 'idleHoldWithBox', 'idleWithBox', 'talkWithBox', 'giveBox', 'idleHoldNoBox', 'exitNoBox', 'arriveNoBox', 'idleNoBox', 'talkNoBox', 'takeBox', 'exitWithBox'];
loopers = ['empty', 'idleHoldWithBox', 'idleHoldNoBox'];
loop_froms = {}

var item_inited:Boolean;
var item_ran:Boolean;
var head:MovieClip;

if (!item_inited) itemInit();

function itemInit():void {
	myAnim = 'empty';
	head = animatee.headContainer_mc.getChildAt(0);
	item_inited = true;
}

//do_trace = true;
//itemRun()
function itemRun():void {
	if (item_ran) return;
	
	// DEFAULT!
	var temp_ob4:Object = {
		variant: 'red',
		head: '1'
	}
	
	//initializehead(temp_ob4);
	//stopAll();
	trackFrames();
	//setTimeout(playAnimation, 3000, 'talkWithBox');
	//stopAll();
	//setTimeout(playAnimationSeq, 1000, ['idleHoldWithBox:40', 'talkNoBox', 'idleHoldWithBox:40', 'talkNoBox'], true);
	item_ran = true;
	//LogCoords(animatee, 20)
	
}

function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	//animatee.headContainer_mc.visible = false
	head = addArticleToContainer(ob.variant+'Head'+ob.head, animatee, 'headContainer_mc') || head;
	addArticleToContainer(ob.variant+'CoatFar', animatee, 'coatFarContainer_mc');
	addArticleToContainer(ob.variant+'CoatClose', animatee, 'coatCloseContainer_mc');
}
