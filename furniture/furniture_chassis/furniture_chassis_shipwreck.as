var item_inited:Boolean;
var item_ran:Boolean;

var house_mc:MovieClip;
var door:MovieClip;
var siding:MovieClip;
var stairs:MovieClip;
var bowdeco:MovieClip;
var mast:MovieClip;

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
				siding: 'Siding',
                stairs: 'Stairs',
                bowdeco: 'Bow Decoration',
                mast: 'Mast'
        };
			
	config_options = {
		door: [
			'door_window',
			'door_wheel',
			'door_curtain_yellow',
			'door_curtain_white',
			'door_curtain_orange'
		],
		siding: [
			'siding_redwhite',
			'siding_bluewhite',
			'siding_bluegreen',
			'siding_blackwhite',
			'siding_blackred'
		],
		stairs: [
			'stairs_planks',
			'stairs_logs',
			'stairs_rocks'
		],
		bowdeco: [
			'bowdeco_woodrope',
			'bowdeco_rook',
			'bowdeco_pigbones',
			'bowdeco_mermaid',
			'bowdeco_grendaline',
			'bowdeco_nothing'
		],
		mast: [
			'mast_tornfabric',
			'mast_rope',
			'mast_pigflag',
			'mast_grendalineflag',
			'mast_crowsnest_white',
			'mast_crowsnest'
		]
	}
	;
	house_mc = maincontainer_mc.house_mc;
	door = house_mc.doorContainer_mc.getChildAt(0) as MovieClip;
	siding = house_mc.sidingContainer_mc.getChildAt(0) as MovieClip;
	stairs = house_mc.stairsContainer_mc.getChildAt(0) as MovieClip;
	bowdeco = house_mc.bowdecoContainer_mc.getChildAt(0) as MovieClip;
	mast = house_mc.mastContainer_mc.getChildAt(0) as MovieClip;

	
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
	door = addArticleToContainer(ob.door, house_mc, 'doorContainer_mc') || door;
	siding = addArticleToContainer(ob.siding, house_mc, 'sidingContainer_mc') || siding;
	stairs = addArticleToContainer(ob.stairs, house_mc, 'stairsContainer_mc') || stairs;
	bowdeco = addArticleToContainer(ob.bowdeco, house_mc, 'bowdecoContainer_mc') || bowdeco;
	mast = addArticleToContainer(ob.mast, house_mc, 'mastContainer_mc') || mast;
}


