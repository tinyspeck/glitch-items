animatee = maincontainer_mc;
animated_mcs = ['book'];
animations = ['blank', 'appear1', 'appear2', 'idle0', 'idle1', 'idle2', 'react', 'talk', 'lookBack', 'lookBackBlink', 'lookForward', 'readStart', 'read', 'readBreak', 'readTalk', 'readResume', 'readEnd'];
loopers = ['talk', 'read', 'readTalk'];

var item_inited:Boolean;
var item_ran:Boolean;

var book:MovieClip;

var config_options:Object = {
	book: [
		"orangeBook"
	]
}

if (!item_inited) itemInit();
function itemInit():void {
	myAnim = 'idle0';
	
	book = animatee.bookContainer_mc.getChildAt(0) as MovieClip;
	
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

	book = addArticleToContainer(correctObValue(ob.book), animatee, 'bookContainer_mc');
}
