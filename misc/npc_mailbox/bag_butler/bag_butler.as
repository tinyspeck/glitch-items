animatee = butlerDoll_mc;
animated_mcs = ['face', 'skull'];
animations = ['idle0', 'danceStart', 'dance', 'walk1', 'walk2', 'idle1', 'idle2', 'idle3', 'fall', 'walk3', 'talk', 'turnBack', 'turnFront', 'walk4', 'stepBack', 'idle4', 'acknowledge', 'fastDance', 'bow', 'jump', 'wave', 'startle1', 'startle2', 'startle0'];
loopers = ['dance', 'walk1', 'walk2', 'walk3', 'talk', 'walk4', 'stepBack', 'fastDance'];

var item_inited:Boolean;
var item_ran:Boolean;

var headContainer:MovieClip;
var accessoryOver:MovieClip;
var accessoryUnder:MovieClip;
var body:MovieClip;
var skull:MovieClip;
var face:MovieClip;
var closeArmLower:MovieClip;
var closeArmUpper:MovieClip;
var farArmLower:MovieClip;
var farArmUpper:MovieClip;
var closeLegLower:MovieClip;
var closeLegUpper:MovieClip;
var farLegLower: MovieClip;
var farLegUpper:MovieClip;
        
var config_option_names = {
	accessory: 'Accessory',
	bod: 'Body',
	skull: 'Head',
	face: 'Face',
	closeArm: 'Arm 1',
	farArm: 'Arm 2',
	closeLeg: 'Leg 1',
	farLeg: 'Leg 2'
}

var config_option_names_sort:Array = ['skull', 'face', 'accessory', 'bod', 'closeArm', 'farArm', 'closeLeg', 'farLeg'];

var config_options:Object = {
	accessory: [
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		"10",
		"11",
		"12"
	],
	bod: [
		"body1",
		"body2",
		"body3",
		"body4",
		"body5",
		"body6",
		"body7",
		"body8",
		"body9",
		"body10",
		"body11",
		"body12",
		"body13",
		"body14",
		"body15",
		"body16"
	],
	skull: [
		"skull1",
		"skull2",
		"skull3",
		"skull4",
		"skull5",
		"skull6",
		"skull7",
		"skull8",
		"skull9",
		"skull10",
		"skull11",
		"skull12",
		"skull13",
		"skull14",
		"skull15",
		"skull16",
		"skull17",
		"skull18",
		"skull19",
		"skull20",
		"skull21",
		"skull22"
	],
	face: [
		"face1",
		"face2",
		"face3",
		"face4",
		"face5",
		"face6",
		"face7",
		"face8",
		"face9",
		"face10",
		"face11",
		"face12",
		"face13"
	],
	closeArm: [
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		"10",
		"11",
		"12"
	],
	farArm: [
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		"10",
		"11",
		"12"
	],
	closeLeg: [
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		"10",
		"11",
		"12",
		"13"
	],
	farLeg: [
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		"10",
		"11"
	]

}

if (!item_inited) itemInit();
function itemInit():void {
	myAnim = 'idle0';
	
	headContainer = animatee.headContainer_mc;
	face = headContainer.faceContainer_mc.getChildAt(0) as MovieClip;
	skull = headContainer.skullContainer_mc.getChildAt(0) as MovieClip;
	accessoryOver = animatee.accessoryOverContainer_mc.getChildAt(0) as MovieClip;
	accessoryUnder = animatee.accessoryUnderContainer_mc.getChildAt(0) as MovieClip;
	body = animatee.bodyContainer_mc.getChildAt(0) as MovieClip;
	closeArmLower = animatee.closeArmLowerContainer_mc.getChildAt(0) as MovieClip;
	closeArmUpper = animatee.closeArmUpperContainer_mc.getChildAt(0) as MovieClip;
	farArmLower = animatee.farArmLowerContainer_mc.getChildAt(0) as MovieClip;
	farArmUpper = animatee.farArmUpperContainer_mc.getChildAt(0) as MovieClip;
	closeLegLower = animatee.closeLegLowerContainer_mc.getChildAt(0) as MovieClip;
	closeLegUpper = animatee.closeLegUpperContainer_mc.getChildAt(0) as MovieClip;
	farLegLower = animatee.farLegLowerContainer_mc.getChildAt(0) as MovieClip;
	farLegUpper = animatee.farLegUpperContainer_mc.getChildAt(0) as MovieClip;
	
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

//do_trace = true;
//itemRun()
function itemRun():void {
	if (item_ran) return;
	stopAll();
	trackFrames();
	item_ran = true;	
}

function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	
	accessoryOver = addArticleToContainer('accessoryOver'+ob.accessory, animatee, 'accessoryOverContainer_mc') || accessoryOver;
	accessoryUnder = addArticleToContainer('accessoryUnder'+ob.accessory, animatee, 'accessoryUnderContainer_mc') || accessoryUnder;
	
	body = addArticleToContainer(ob.bod, animatee, 'bodyContainer_mc') || body;
	
	skull = addArticleToContainer(ob.skull, headContainer, 'skullContainer_mc') || skull;

	face = addArticleToContainer(ob.face, headContainer, 'faceContainer_mc') || face;
	
	closeArmLower = addArticleToContainer('closeArmLower'+ob.closeArm, animatee, 'closeArmLowerContainer_mc') || closeArmLower;
	closeArmUpper = addArticleToContainer('closeArmUpper'+ob.closeArm, animatee, 'closeArmUpperContainer_mc') || closeArmUpper;
	
	farArmLower = addArticleToContainer('farArmLower'+ob.farArm, animatee, 'farArmLowerContainer_mc') || farArmLower;
	farArmUpper = addArticleToContainer('farArmUpper'+ob.farArm, animatee, 'farArmUpperContainer_mc') || farArmUpper;
	
	closeLegLower = addArticleToContainer('closeLegLower'+ob.closeLeg, animatee, 'closeLegLowerContainer_mc') || closeLegLower;
	closeLegUpper = addArticleToContainer('closeLegUpper'+ob.closeLeg, animatee, 'closeLegUpperContainer_mc') || closeLegUpper;
	
	farLegLower = addArticleToContainer('farLegLower'+ob.farLeg, animatee, 'farLegLowerContainer_mc') || farLegLower;
	farLegUpper = addArticleToContainer('farLegUpper'+ob.farLeg, animatee, 'farLegUpperContainer_mc') || farLegUpper;
	
}
