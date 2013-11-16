var item_inited:Boolean;
var item_ran:Boolean;
var frame_w:int = 5;
var matte_w:int = 10;
var border_w:int = 0;

var snap_frame:MovieClip;
var snap_matte:MovieClip;

var config_options:Object;

itemInit();

function itemInit():void {
	if (item_inited) return;
	border_w = frame_w+matte_w
	animatee = this;
	animated_mcs = [];
	animations = ['1'];
	loopers = [];
	myAnim = '1';
	
	config_options = {
		snap_h: ['100', '144', '72'],
		snap_w: ['100', '72', '144']
	}
	
	snap_frame = maincontainer_mc.getChildAt(0) as MovieClip;
	snap_matte = maincontainer_mc.getChildAt(1) as MovieClip;
	
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
	if (ob.snap_w && ob.snap_h) {
		snap_frame.width = int(ob.snap_w)+(border_w*2);
		snap_frame.height = int(ob.snap_h)+(border_w*2);
		
		snap_frame.x = -int(snap_frame.width/2);
		snap_frame.y = -snap_frame.height;
		
		
		snap_matte.width = snap_frame.width-(frame_w*2);
		snap_matte.height = snap_frame.height-(frame_w*2);
		
		snap_matte.x = snap_frame.x+frame_w;
		snap_matte.y = snap_frame.y+frame_w;
		
		return;
		var rect:Rectangle = snap_frame.getBounds(snap_frame.parent);
		trace(rect);
		
		
		trace(snap_frame.y);
		//snap_frame.y = -rect.height;
		trace(snap_frame.y);
	}
	
}


