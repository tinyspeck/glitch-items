var item_inited:Boolean;
var item_ran:Boolean;

var house_mc:MovieClip;
var siding:MovieClip;
var bottom:MovieClip;
var branches:MovieClip;
var door:MovieClip;
var platform:MovieClip;
var top:MovieClip;
var windows:MovieClip;
var steps:MovieClip;


var config_options:Object;
var config_option_names:Object;

itemInit();

function itemInit():void {
	if (item_inited) return;
	animatee = this;
	animated_mcs = [];
	animations = ['1'];
	loopers = [];
	myAnim = '1';

config_option_names = {
                siding: 'Siding',
                bottom: 'Base',
                branches: 'Branches',
                door: 'Door',
                platform: 'Platform',
                top: 'Top',
                windows: 'Windows',
                steps: 'Steps'
        }
		
	config_options = {
		siding: [
			'body_brown',
			'body_red',
			'body_yellow',
			'body_black',
			'body_white'
		],
		bottom: [
			'bottom_brownmed',
			'bottom_redlong',
			'bottom_yellowsmall',
			'bottom_black',
			'bottom_white'
		],
		branches: [
			'branches_bells',
			'branches_charms',
			'branches_lower',
			'branches_lanterns',
			'branches_medium',
			'branches_plain',
			'branches_wishes',
			'branches_black',
			'branches_white',
			'branches_empty'
		],
		door: [
			'door_blue',
			'door_green',
			'door_orange',
			'door_pink',
			'door_purple',
			'door_red',
			'door_black',
			'door_white'
		],
		platform: [
			'platform_brown',
			'platform_green',
			'platform_purple',
			'platform_black'
		],
		top: [
			'topdeco_firebean',
			'topdeco_mushrooms',
			'topdeco_plant',
			'topdeco_black',
			'topdeco_white',
			'topdeco_empty'
		],
		windows: [
			'windows_circle',
			'windows_slits',
			'windows_teardrops',
			'windows_black',
			'windows_white'
		],
		steps: [
			'steps_green',
			'steps_black',
			'steps_red',
			'steps_white',
			'steps_yellow'
		]
	}
	
	house_mc = maincontainer_mc.house_mc;
	siding = house_mc.bodyContainer_mc.getChildAt(0) as MovieClip;
	bottom = house_mc.bottomContainer_mc.getChildAt(0) as MovieClip;
	branches = house_mc.branchesContainer_mc.getChildAt(0) as MovieClip;
	door = house_mc.doorContainer_mc.getChildAt(0) as MovieClip;
	platform = house_mc.platformContainer_mc.getChildAt(0) as MovieClip;
	top = house_mc.topContainer_mc.getChildAt(0) as MovieClip;
	windows = house_mc.windowsContainer_mc.getChildAt(0) as MovieClip;
	steps = house_mc.stepsContainer_mc.getChildAt(0) as MovieClip;
	
	
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
	siding = addArticleToContainer(ob.siding, house_mc, 'bodyContainer_mc') || siding;
	bottom = addArticleToContainer(ob.bottom, house_mc, 'bottomContainer_mc') || bottom;
	branches = addArticleToContainer(ob.branches, house_mc, 'branchesContainer_mc') || branches;
	door = addArticleToContainer(ob.door, house_mc, 'doorContainer_mc') || door;
	platform = addArticleToContainer(ob.platform, house_mc, 'platformContainer_mc') || platform;
	top = addArticleToContainer(ob.top, house_mc, 'topContainer_mc') || top;
	windows = addArticleToContainer(ob.windows, house_mc, 'windowsContainer_mc') || windows;
	steps = addArticleToContainer(ob.steps, house_mc, 'stepsContainer_mc') || steps;
}


