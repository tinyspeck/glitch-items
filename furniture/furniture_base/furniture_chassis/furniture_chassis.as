var item_inited:Boolean;
var item_ran:Boolean;

var house_mc:MovieClip;
var chimney:MovieClip;
var door:MovieClip;
var entrance:MovieClip;
var roof:MovieClip;
var siding:MovieClip;
var window:MovieClip;

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
                chimney: 'Chimney',
                door: 'Door',
                entrance: 'Portico',
                roof: 'Roof',
                siding: 'Siding',
                window: 'Windows'
        }
			
	config_options = {
		chimney: [
			'chimney_metal1',
			'chimney_stone1',
			'chimney_treebranch',
			'chimney_twisty_white',
			'chimney_twisty1',
			'chimney_twisty2',
			'chimney_empty'
		],
		door: [
			'door_leafy',
			'door_wood',
			'door_woodwithknocker',
			'door_woodwithknocker_dark',
			'door_woodwithknocker_light',
			'door_woodwithknocker_white'
		],
		entrance: [
			'entrance_none',
			'entrance_vines',
			'entrance_wood',
			'entrance_black'
		],
		roof: [
			'roof_fabric_white',
			'roof_fabric1',
			'roof_flower1',
			'roof_flower2',
			'roof_log',
			'roof_wood',
			'roof_wood_black',
			'roof_woodwithdormer'
		],
		siding: [
			'siding_adobe_tan',
			'siding_black',
			'siding_flowers_pink',
			'siding_logcabin',
			'siding_medieval',
			'siding_rocky',
			'siding_treetrunk',
			'siding_white'
		],
		window: [
			'window_circle',
			'window_black',
			'window_flowers1',
			'window_flowers2',
			'window_flowers3',
			'window_flowers4',
			'window_flowers_white',
			'window_square'
		]
	}
	
	house_mc = maincontainer_mc.house_mc;
	chimney = house_mc.chimneyContainer_mc.getChildAt(0) as MovieClip;
	door = house_mc.doorContainer_mc.getChildAt(0) as MovieClip;
	entrance = house_mc.entranceContainer_mc.getChildAt(0) as MovieClip;
	roof = house_mc.roofContainer_mc.getChildAt(0) as MovieClip;
	siding = house_mc.sidingContainer_mc.getChildAt(0) as MovieClip;
	window = house_mc.windowContainer_mc.getChildAt(0) as MovieClip;

	
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
	chimney = addArticleToContainer(ob.chimney, house_mc, 'chimneyContainer_mc') || chimney;
	door = addArticleToContainer(ob.door, house_mc, 'doorContainer_mc') || door;
	entrance = addArticleToContainer(ob.entrance, house_mc, 'entranceContainer_mc') || entrance;
	siding = addArticleToContainer(ob.siding, house_mc, 'sidingContainer_mc') || siding;
	roof = addArticleToContainer(ob.roof, house_mc, 'roofContainer_mc') || roof;
	window = addArticleToContainer(ob.window, house_mc, 'windowContainer_mc') || window;
}


