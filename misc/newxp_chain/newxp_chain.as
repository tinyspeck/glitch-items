animatee = newxpchain_mc;
animated_mcs = ['speechBubble'];
animations = ['hang','pull'];
loopers = ['hang'];

var item_inited:Boolean;
var item_ran:Boolean;

var speechBubble:MovieClip;

var config_options:Object = {
	speechBubble: [
		"none",
		"pullMe1",
		"pullMe2"
	]

}

if (!item_inited) itemInit();
function itemInit():void {
	myAnim = 'hang';
	
	speechBubble = animatee.speechBubbleContainer_mc.getChildAt(0) as MovieClip;
	
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

function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	
	speechBubble = addArticleToContainer(ob.speechBubble, animatee, 'speechBubbleContainer_mc') || speechBubble;
	
}
