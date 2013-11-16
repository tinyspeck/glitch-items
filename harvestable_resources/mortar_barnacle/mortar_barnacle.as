animatee = maincontainer_mc;
animated_mcs = ['blister'];
animations = ['empty', 'small', 'big', 'ready'];
loopers = [];
do_trace = true
asset_class_names = [
	"blister1",
	"blister2",
	"blister3",
	"blister4",
	"blister5",
	"blister6",
];

var item_inited:Boolean;
var item_ran:Boolean;
var blister:MovieClip;
var blistercontainer:MovieClip;

var config_options:Object = {
	blister: [
		"blister1",
		"blister2",
		"blister3",
		"blister4",
		"blister5",
		"blister6"
	]
}


if (!item_inited) itemInit();

function itemInit():void {
	myAnim = 'empty';
	blistercontainer = maincontainer_mc.blistercontainer_mc
	blister = blistercontainer.getChildAt(0) as MovieClip;// child of head.eyesContainer_mc
	item_inited = true;
}

itemRun()
function itemRun():void {
	if (item_ran) return;
	
	// DEFAULT!
	var temp_ob4:Object = {
		blister: 'blister3'
	}
	
	initializehead(temp_ob4);
	//stopAll();
	trackFrames();
	//playAnimation('small');
	//playAnimationSeq(['open', 'close', 'idle_move', 'idle_hold', 'turn', 'talk', 'idle_hold']);
	item_ran = true;
	//LogCoords(animatee, 20)
	
}



function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	blister = addArticleToContainer(ob.blister, maincontainer_mc, 'blistercontainer_mc') || blister;

}



/*










var AvatarAssetsClasses = [
	"L0dirtBase",                              // L0dirtBase
	"L0dirtSkull",                             // L0dirtSkull
	"L0eyes1",                                 // L0eyes1
	"L0eyes2",                                 // L0eyes2
	"L0eyes3",                                 // L0eyes3
	"L1Branches",                              // L1Branches
	"L1FallLeaves",                            // L1FallLeaves
	"L1Feathers",                              // L1Feathers
	"L1FlowerBush",                            // L1FlowerBush
	"L1FlowerTop",                             // L1FlowerTop
	"L1Grass",                                 // L1Grass
	"L1LeafSkirt",                             // L1LeafSkirt
	"L1LeafSprout",                            // L1LeafSprout
	"L1LotusBottom",                           // L1LotusBottom
	"L1LotusTop",                              // L1LotusTop
	"L1WoodAcornBranch",                       // L1WoodAcornBranch
	"L1dirtBase",                              // L1dirtBase
	"L1dirtSeedling",                          // L1dirtSeedling
	"L1dirtSkull",                             // L1dirtSkull
	"L1dirtSpikey",                            // L1dirtSpikey
	"L1eyes1",                                 // L1eyes1
	"L1eyes2",                                 // L1eyes2
	"L1eyes3",                                 // L1eyes3
	"L1flower",                                // L1flower
	"L1grassSkirt",                            // L1grassSkirt
	"L1woodBase",                              // L1woodBase
	"L1woodLeafHat",                           // L1woodLeafHat
	"L1woodRoots",                             // L1woodRoots
	"L1woodSkull",                             // L1woodSkull
	"L1woodSpikey",                            // L1woodSpikey
	"L1woodTwig",                              // L1woodTwig
];


skull: ["L0dirtSkull", "L1dirtSkull", "L1woodSkull"]

eyes: ["L0eyes1", "L0eyes2", "L0eyes3", "L1eyes1", "L1eyes2", "L1eyes3"]

top: ["L1dirtSeedling", "L1dirtSpikey", "L1woodLeafHat", "L1woodSpikey", "L1woodTwig"]

bottom: ["L1Branches", "L1flower", "L1grassSkirt", "L1woodRoots"]

base: ["L0dirtBase", "L1dirtBase", "L1woodBase"]
*/