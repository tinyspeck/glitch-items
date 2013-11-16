var item_inited:Boolean;
var item_ran:Boolean;

var floor_ground:MovieClip;
var floor_top:MovieClip;
var floor_1:MovieClip;
var floor_2:MovieClip;
var floor_3:MovieClip;
var floor_4:MovieClip;
var floor_5:MovieClip;
var floor_6:MovieClip;
var floor_7:MovieClip;
var deco_ground:MovieClip;
var deco_side:MovieClip;
var door:MovieClip;

var bottom_floor_h:int = 211;
var floor_h:int = 73;
var config_options:Object;
var config_option_names:Object;	
var user_config_exclusions:Array = ['extra_floors'];
var config_option_names_sort:Array = ['floor_top', 'floor_7', 'floor_6', 'floor_5', 'floor_4', 'floor_3', 'floor_2', 'floor_1', 'floor_ground', 'deco_ground', 'deco_side'];

itemInit();

function itemInit():void {
	if (item_inited) return;
	animatee = this;
	animated_mcs = [];
	animations = ['1'];
	loopers = [];
	myAnim = '1';

	config_option_names = {
		deco_ground: 'Ground Floor Deco',
		floor_ground: 'Ground Floor',
		deco_side: 'Side Deco',
		floor_top: 'Top Floor',
		floor_1: '1st Floor',
		floor_2: '2nd Floor',
		floor_3: '3rd Floor',
		floor_4: '4th Floor',
		floor_5: '5th Floor',
		floor_6: '6th Floor',
		floor_7: '7th Floor'
	}
			
	config_options = {
		extra_floors: ['0','1','2','3','4','5','6','7'],
		deco_ground: ['1','2','3','4'],
		deco_side: ['1','2','3','4'],
		floor_ground: ['1','2','3'],
		floor_top: ['1','2','3'],
		floor_1: ['1','2','3','4'],
		floor_2: ['1','2','3','4'],
		floor_3: ['1','2','3','4'],
		floor_4: ['1','2','3','4'],
		floor_5: ['1','2','3','4'],
		floor_6: ['1','2','3','4'],
		floor_7: ['1','2','3','4']
	}
	
	floor_ground = maincontainer_mc.floor_ground_container_mc.getChildAt(0) as MovieClip;
	deco_ground = maincontainer_mc.deco_ground_container_mc.getChildAt(0) as MovieClip;
	deco_side = maincontainer_mc.deco_side_container_mc.getChildAt(0) as MovieClip;
	floor_top = maincontainer_mc.floor_top_container_mc.getChildAt(0) as MovieClip;
	floor_1 = maincontainer_mc.floor_1_container_mc.getChildAt(0) as MovieClip;
	floor_2 = maincontainer_mc.floor_2_container_mc.getChildAt(0) as MovieClip;
	floor_3 = maincontainer_mc.floor_3_container_mc.getChildAt(0) as MovieClip;
	floor_4 = maincontainer_mc.floor_4_container_mc.getChildAt(0) as MovieClip;
	floor_5 = maincontainer_mc.floor_5_container_mc.getChildAt(0) as MovieClip;
	floor_6 = maincontainer_mc.floor_6_container_mc.getChildAt(0) as MovieClip;
	floor_7 = maincontainer_mc.floor_7_container_mc.getChildAt(0) as MovieClip;
	door = maincontainer_mc.door_container_mc.getChildAt(0) as MovieClip;

	
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
	floor_ground = addArticleToContainer('floor_ground_'+ob.floor_ground, maincontainer_mc, 'floor_ground_container_mc') || floor_ground;
	door = addArticleToContainer('door_'+ob.floor_ground, maincontainer_mc, 'door_container_mc') || door;
	floor_top = addArticleToContainer('floor_top_'+ob.floor_top, maincontainer_mc, 'floor_top_container_mc') || floor_top;
	
	deco_ground = addArticleToContainer('deco_ground_'+ob.deco_ground, maincontainer_mc, 'deco_ground_container_mc') || deco_ground;
	deco_side = addArticleToContainer('deco_side_'+ob.deco_side, maincontainer_mc, 'deco_side_container_mc') || deco_side;
	
	var extra_floors = int(ob.extra_floors);
	maincontainer_mc.floor_top_container_mc.y = -(bottom_floor_h+(floor_h*extra_floors));
	
	maincontainer_mc.deco_side_container_mc.visible = extra_floors > 0;
	
	user_config_exclusions = ['extra_floors']
	for (var i:int=1;i<=7;i++) {
		if (!ob['floor_'+i]) ob['floor_'+i] = 1; 
		var symbol_name:String = 'none';
		if (i<=extra_floors) {
			symbol_name = 'extra_floor_'+ob['floor_'+i];
		} else {
			user_config_exclusions.push('floor_'+i);
		}
		this['floor_'+i] = addArticleToContainer(symbol_name, maincontainer_mc, 'floor_'+i+'_container_mc') || this['floor_'+1];
	}
	
}


