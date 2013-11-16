var item_inited:Boolean;
var item_ran:Boolean;

var house_mc:MovieClip;
var door:MovieClip;
var fence:MovieClip;
var platform:MovieClip;
var roof:MovieClip;
var window:MovieClip;
var stairsdeco:MovieClip;
var siding:MovieClip;
var topdeco:MovieClip;

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
               door: 'Door',
               fence: 'Fence',
               platform: 'Platform',
               roof: 'Roof',
               siding: 'Siding',
               topdeco: 'Branch Decoration',
               window: 'Windows',
               stairsdeco: 'Entry Stick'
       }
	
	config_options = {
		door: [
			'door_fancy',
			'door_knockerlight',
			'door_knockerred',
			'door_knockerwood',
			'door_pigwood',
			'door_pigdark',
			'door_piggreen'
		],
		fence: [
			'fence_bars',
			'fence_bars_pig',
			'fence_bars_rook',
			'fence_gate',
			'fence_gate_pig',
			'fence_gate_rook',
			'fence_stoner',
			'fence_stoner_pig',
			'fence_stoner_rook',
			'fence_empty'
		],
		platform: [
			'platform_dark',
			'platform_light',
			'platform_steel',
			'platform_steeldark',
			'platform_wood'
		],
		roof: [
			'roof_bonegreen',
			'roof_bonered',
			'roof_bonetan',
			'roof_fancy',
			'roof_fancy_white',
			'roof_wood',
			'roof_wooddark',
			'roof_woodlight',
			'roof_woodred'
		],
		window: [
			'window_fancy',
			'window_fancylight',
			'window_boarddark',
			'window_archwood',
			'window_archdark',
			'window_roundwood',
			'window_rounddark',
			'window_roundlight',
		],
		stairsdeco: [
			'stairsdeco_none',
			'stairsdeco_fancy',
			'stairsdeco_fancyrook',
			'stairsdeco_pighead',
			'stairsdeco_chicken',
			'stairsdeco_butterfly',
			'stairsdeco_pig'
		],
		siding: [
			'siding_natural',
			'siding_white',
			'siding_black',
			'siding_red',
			'siding_green',
			'siding_purple',
			'siding_navy',
			'siding_yellow'
		],
		topdeco: [
			'topdeco_clothesline',
			'topdeco_dreamcatcher',
			'topdeco_empty',
			'topdeco_rook',
			'topdeco_tire',
			'topdeco_voodoodoll'
		]
	}
	
	house_mc = maincontainer_mc.house_mc;
	door = house_mc.doorContainer_mc.getChildAt(0) as MovieClip;
	fence = house_mc.fenceContainer_mc.getChildAt(0) as MovieClip;
	platform = house_mc.platformContainer_mc.getChildAt(0) as MovieClip;
	roof = house_mc.roofContainer_mc.getChildAt(0) as MovieClip;
	window = house_mc.windowContainer_mc.getChildAt(0) as MovieClip;
	stairsdeco = house_mc.stairsdecoContainer_mc.getChildAt(0) as MovieClip;
	siding = house_mc.sidingContainer_mc.getChildAt(0) as MovieClip;
	topdeco = house_mc.topdecoContainer_mc.getChildAt(0) as MovieClip;
	
	
	if (true) {
		var temp_ob4:Object = {};
		var index:int = 0;
		for (var k:String in config_options) {
			which = index
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
	door = addArticleToContainer(ob.door, house_mc, 'doorContainer_mc') || door;
	fence = addArticleToContainer(ob.fence, house_mc, 'fenceContainer_mc') || fence;
	platform = addArticleToContainer(ob.platform, house_mc, 'platformContainer_mc') || platform;
	roof = addArticleToContainer(ob.roof, house_mc, 'roofContainer_mc') || roof;
	window = addArticleToContainer(ob.window, house_mc, 'windowContainer_mc') || window;
	stairsdeco = addArticleToContainer(ob.stairsdeco, house_mc, 'stairsdecoContainer_mc') || stairsdeco;
	siding = addArticleToContainer(ob.siding, house_mc, 'sidingContainer_mc') || siding;
	topdeco = addArticleToContainer(ob.topdeco, house_mc, 'topdecoContainer_mc') || topdeco;
}


