var item_inited:Boolean;
var item_ran:Boolean;

var house_mc:MovieClip;
var door:MovieClip;
var fence:MovieClip;
var statue:MovieClip;
var roof:MovieClip;
var topdeco:MovieClip;
var window:MovieClip;
var stairs:MovieClip;
var stairsdeco:MovieClip;
var siding:MovieClip;
var platform:MovieClip;

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
			'door_knockerwood',
			'door_knockerdark',
			'door_knockerlight',
			'door_knockerred',
			'door_knockergreen',
			'door_pigwood',
			'door_pigdark',
			'door_piglight',
			'door_pigred',
			'door_piggreen'
		],
		fence: [
			'fence_bars',
			'fence_stoner'
		],
		statue: [
			'statue_rooks',
			'statue_pigs'
		],
		roof: [
			'roof_wood',
			'roof_woodlight',
			'roof_wooddark',
			'roof_woodred',
			'roof_woodgreen',
			'roof_bonetan',
			'roof_bonegreen',
			'roof_bonepink'
		],
		topdeco: [
			'topdeco_rook',
			'topdeco_voodoodoll',
			'topdeco_dreamcatcher',
			'topdeco_clothesline',
			'topdeco_tire',
			'topdeco_empty'
		],
		window: [
			'window_boardwood',
			'window_boarddark',
			'window_boardlight',
			'window_archwood',
			'window_archdark',
			'window_archlight',
			'window_roundwood',
			'window_rounddark',
			'window_roundlight',
		],
		stairs: [
			'stairs_woodlight',
			'stairs_wooddark',
			'stairs_wood',
			'stairs_steeldark',
			'stairs_steellight'
		],
		stairsdeco: [
			'stairsdeco_pighead',
			'stairsdeco_chicken',
			'stairsdeco_butterfly',
			'stairsdeco_pig'
		],
		siding: [
			'siding_tan',
			'siding_white',
			'siding_mediumgray',
			'siding_black',
			'siding_lightred',
			'siding_red',
			'siding_green',
			'siding_purple'
		],
		platform: [
			'platform_wood',
			'platform_dark',
			'platform_light'
		]
	}
	
	house_mc = maincontainer_mc.house_mc;
	door = house_mc.doorContainer_mc.getChildAt(0) as MovieClip;
	fence = house_mc.fenceContainer_mc.getChildAt(0) as MovieClip;
	statue = house_mc.statueContainer_mc.getChildAt(0) as MovieClip;
	roof = house_mc.roofContainer_mc.getChildAt(0) as MovieClip;
	topdeco = house_mc.topdecoContainer_mc.getChildAt(0) as MovieClip;
	window = house_mc.windowContainer_mc.getChildAt(0) as MovieClip;
	stairs = house_mc.stairsContainer_mc.getChildAt(0) as MovieClip;
	stairsdeco = house_mc.stairsdecoContainer_mc.getChildAt(0) as MovieClip;
	siding = house_mc.sidingContainer_mc.getChildAt(0) as MovieClip;
	platform = house_mc.platformContainer_mc.getChildAt(0) as MovieClip;
	
	
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
	statue = addArticleToContainer(ob.statue, house_mc, 'statueContainer_mc') || statue;
	roof = addArticleToContainer(ob.roof, house_mc, 'roofContainer_mc') || roof;
	stairsdeco = addArticleToContainer(ob.stairsdeco, house_mc, 'stairsdecoContainer_mc') || stairsdeco;
	topdeco = addArticleToContainer(ob.topdeco, house_mc, 'topdecoContainer_mc') || topdeco;
	window = addArticleToContainer(ob.window, house_mc, 'windowContainer_mc') || window;
	stairs = addArticleToContainer(ob.stairs, house_mc, 'stairsContainer_mc') || stairs;
	siding = addArticleToContainer(ob.siding, house_mc, 'sidingContainer_mc') || siding;
	platform = addArticleToContainer(ob.platform, house_mc, 'platformContainer_mc') || platform;
}


