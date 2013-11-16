animatee = sloth_mc;
animated_mcs = ['bandana', 'headContainer'];
animations = ['iconic','hidden', 'peek', 'peekIdle', 'peekWithdraw', 'drop', 'hangIdle1', 'hangIdle2', 'eat', 'spit', 'finishedEating', 'talk', 'climbUp', 'spit2', 'peekIdle2', 'peekSpit', 'devilStart', 'devil', 'devilEnd'];
loopers = ['eat', 'devil'];

var item_inited:Boolean;
var item_ran:Boolean;

var headContainer:MovieClip;
var bandana:MovieClip;
var jacket:MovieClip;
var rod:MovieClip;

var config_options:Object = {
	bandana: [
		"none",
		"redBandana",
		"blueBandana"
	],
	jacket: [
		"none",
		"darkJacket",
		"lightJacket"
	],
	rod: [
		"none",
		"rod1",
		"rod2",
		"rod3",
		"rod4",
		"rod5",
		"rod6",
		"rod7"
	]
}

if (!item_inited) itemInit();
function itemInit():void {
	myAnim = 'hidden';
	
	headContainer = animatee.headContainer_mc;
	bandana = headContainer.headBandContainer_mc.getChildAt(0) as MovieClip;
	jacket = animatee.jacketContainer_mc.getChildAt(0) as MovieClip;
	rod = animatee.rodContainer_mc.getChildAt(0) as MovieClip;
	
	if (true) {
		var temp_ob4:Object = {};
		var index:int = 0;
		for (var k:String in config_options) {
			var which:int = index
			if (which >= config_options[k].length) which = config_options[k].length-1
			trace(k+' '+which+' '+config_options[k][which]);
			temp_ob4[k] = config_options[k][which]
		}
		
		initializehead(temp_ob4);
	}
	
	item_inited = true;
}

//do_trace = true;
//itemRun()
function itemRun():void {
	if (item_ran) return;
	stopAll();
	trackFrames();
	item_ran = true;	
}

function correctObValue(val:String):String {
	if (!val) return 'none';
	if (val.toLowerCase() == 'none') return 'none';
	return val;
}

function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	
	bandana = addArticleToContainer(correctObValue(ob.bandana), headContainer, 'headBandContainer_mc');
	jacket = addArticleToContainer(correctObValue(ob.jacket), animatee, 'jacketContainer_mc');
	rod = addArticleToContainer(correctObValue(ob.rod), animatee, 'rodContainer_mc');
}

