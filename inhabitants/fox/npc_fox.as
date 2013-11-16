animations = ['still', 'run', 'eatStart', 'eat', 'eatEnd', 'pause', 'jump', 'taunt', 'brushed', 'walk'];
loopers = ['still', 'run', 'eat', 'brushed', 'walk'];
myAnim = 'still';

var item_inited:Boolean;
var item_ran:Boolean;

var config_options:Object = {
	fox: [
		"orangeFox",
		"silverFox",
	]

}

if (!item_inited) itemInit();
function itemInit():void {

	animatee = foxContainer_mc.getChildAt(0) as MovieClip;
	myAnim = 'still';
	
	if (false) {
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
	//playAnimation(myAnim)
}

function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	animatee = addArticleToContainer(ob.fox, this, 'foxContainer_mc') || animatee;
}
