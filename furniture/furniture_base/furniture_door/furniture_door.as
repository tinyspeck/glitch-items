var item_inited:Boolean;
var item_ran:Boolean;

var door:MovieClip;

var config_options:Object;

itemInit();

function itemInit():void {
	if (item_inited) return;
	animatee = this;
	animated_mcs = [];
	animations = ['1'];
	loopers = [];
	myAnim = '1';
	
	config_options = {
		door: [
			'door_up',
			'door_down',
			'door_down_job',
			'door_up_job'
		]
	}
	
	door = maincontainer_mc.doorContainer_mc.getChildAt(0) as MovieClip;
	
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

//itemRun()

function itemRun():void {
	if (item_ran) return;
	//do_trace = true
	// DEFAULT!
	
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
	door = addArticleToContainer(ob.door, maincontainer_mc, 'doorContainer_mc') || door;
}


