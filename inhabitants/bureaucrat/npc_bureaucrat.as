//animatee = streetspirit_mc;
//animated_mcs = ['head', 'body', 'eyes', 'top', 'skull', 'bottom', 'base'];
//animations = ['idle_hold', 'talk', 'turn', 'open', 'close', 'idle_move'];
//loopers = ['idle_move', 'talk', 'idle_hold'];

animatee = bureaucrat;
animated_mcs = ['head'];
animations = ['iconic','walk1', 'walk2', 'talk', 'idle0', 'idle1', 'idle2'];
loopers = ['walk1', 'walk2', 'idle0'];

var item_inited:Boolean;
var item_ran:Boolean;
var head:MovieClip;

var config_options:Object = {
	arms: [
		"none",
		"01",
		"02",
		"03",
		"04"
	],
	torso: [
		"none",
		"01",
		"02",
		"03",
		"04"
	],
	legs: [
		"none",
		"01",
		"02",
		"03",
		"04"
	],
	hair: [
		"none",
		"01",
		"02",
		"03",
		"04",
		"05"
	],
	necklace: [
		"none",
		"01",
		"02"
	],
	tie: [
		"none",
		"01",
		"02"
	],
	glasses: [
		"none",
		"01"
	]
}


if (!item_inited) itemInit();

function itemInit():void {
	myAnim = 'idle0';
	head = animatee.headContainer_mc;
	item_inited = true;
}

//do_trace = true;
//itemRun()
function itemRun():void {
	if (item_ran) return;
	/*
	var temp_ob:Object = {
		skull: 'L1dirtSkull',
		eyes: 'L1eyes3',
		top: 'L1dirtSeedling',
		bottom: 'L1grassSkirt',
		base: 'L1dirtBase'
	}
	
	// different
	var temp_ob2:Object = {
		skull: 'L1woodSkull',
		eyes: 'L1eyes1',
		top: 'L1woodLeafHat',
		bottom: 'L1flower',
		base: 'L1woodBase'
	}
	
	var temp_ob3:Object = {
		skull: 'skull_L1dirt',
		eyes: 'eyes_L1eyes1',
		top: 'top_L1woodLeafHat',
		bottom: 'bottom_L1LotusBottom',
		base: 'base_L1dirt'
	}
	*/
	
	// DEFAULT!
	var temp_ob4:Object = {
		torso: '01',
		arms: '01',
		legs: '01',
		hair: '01',
		necklace: '01',
		tie: 'none',
		glasses: 'none'
	}
	
	//initializehead(temp_ob4);
	//stopAll();
	trackFrames();
	//playAnimation('turn');
	//playAnimationSeq(['open', 'close', 'idle_move', 'idle_hold', 'turn', 'talk', 'idle_hold']);
	item_ran = true;
	//LogCoords(animatee, 20)
	
}



function correctObValue(pre:String, val:String):String {
	if (!val) return 'none';
	if (val.toLowerCase() == 'none') return 'none';
	return pre+val;

}


function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	
	addArticleToContainer(correctObValue('armLowerClose', ob.arms), animatee, 'armLowerCloseContainer_mc');
	addArticleToContainer(correctObValue('armUpperClose', ob.arms), animatee, 'armUpperCloseContainer_mc');
	addArticleToContainer(correctObValue('armFar', ob.arms), animatee, 'armFarContainer_mc');
	
	addArticleToContainer(correctObValue('legFar', ob.legs), animatee, 'legFarContainer_mc');
	addArticleToContainer(correctObValue('legClose', ob.legs), animatee, 'legCloseContainer_mc');
	addArticleToContainer(correctObValue('footClose', ob.legs), animatee, 'footCloseContainer_mc');
	
	addArticleToContainer(correctObValue('hair', ob.hair), head, 'hairContainer_mc');
	
	addArticleToContainer(correctObValue('glasses', ob.glasses), head, 'glassesContainer_mc');
	
	addArticleToContainer(correctObValue('necklace', ob.necklace), animatee, 'necklaceContainer_mc');
	
	addArticleToContainer(correctObValue('tie', ob.tie), animatee, 'tieContainer_mc');
	
	addArticleToContainer(correctObValue('body', ob.torso), animatee, 'bodyContainer_mc');
}




