var item_inited:Boolean;
var item_ran:Boolean;

var house_mc:MovieClip;
var body:MovieClip;
var door:MovieClip;
var side:MovieClip;
var top:MovieClip;
var topdeco:MovieClip;
var windows:MovieClip;

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
                body: 'Base',
                door: 'Door',
                side: 'Extension',
                top: 'Top Floor',
                topdeco: 'Top Decoration',
                windows: 'Windows'
        }
        
	config_options = {
		body: [
			'body_bluepurple_ceramic',
			'body_greenred_ceramic',
			'body_purplered_ceramic',
			'body_bluepurple_wood',
			'body_bluepurple_woodblack',
			'body_greenred_wood',
			'body_greenred_woodblack',
			'body_purplered_wood',
			'body_purplered_woodblack',
			'body_whiteblack',
			'body_blackwhite'
		],
		door: [
			'door_curvy_blackwhite',
			'door_curvy_blue',
			'door_curvy_red',
			'door_purplered',
			'door_round_blue',
			'door_round_brown',
			'door_square_brown',
			'door_square_green'
		],
		side: [
			'side_blackwhite',
			'side_blue',
			'side_blue_three',
			'side_blue_two',
			'side_darkred_three',
			'side_green',
			'side_green_three',
			'side_green_two',
			'side_purple',
			'side_purple_two',
			'side_whiteblack',
			'side_empty'
		],
		top: [
			'top_blackwhite',
			'top_darkred',
			'top_darkred_three',
			'top_darkred_two',
			'top_purple',
			'top_purple_three',
			'top_purple_two',
			'top_red',
			'top_red_three',
			'top_red_two',
			'top_whiteblack'
		],
		topdeco: [
			'topdeco_bare',
			'topdeco_birdhouse',
			'topdeco_mushrooms',
			'topdeco_umbrella',
			'topdeco_weathervane',
			'topdeco_empty'
		],
		windows: [
			'windows_closed_brown',
			'windows_closed_yellow',
			'windows_shutters_grey',
			'windows_shutters_purple',
			'windows_square_pink',
			'windows_square_purple'
		]
	}
	
	house_mc = maincontainer_mc.house_mc;
	body = house_mc.bodyContainer_mc.getChildAt(0) as MovieClip;
	door = house_mc.doorContainer_mc.getChildAt(0) as MovieClip;
	side = house_mc.sideContainer_mc.getChildAt(0) as MovieClip;
	top = house_mc.topContainer_mc.getChildAt(0) as MovieClip;
	topdeco = house_mc.topdecoContainer_mc.getChildAt(0) as MovieClip;
	windows = house_mc.windowsContainer_mc.getChildAt(0) as MovieClip;
	
	
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
	body = addArticleToContainer(ob.body, house_mc, 'bodyContainer_mc') || body;
	door = addArticleToContainer(ob.door, house_mc, 'doorContainer_mc') || door;
	side = addArticleToContainer(ob.side, house_mc, 'sideContainer_mc') || side;
	top = addArticleToContainer(ob.top, house_mc, 'topContainer_mc') || top;
	topdeco = addArticleToContainer(ob.topdeco, house_mc, 'topdecoContainer_mc') || topdeco;
	windows = addArticleToContainer(ob.windows, house_mc, 'windowsContainer_mc') || windows;
}


