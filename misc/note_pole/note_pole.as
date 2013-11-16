animatee = mainContainer_mc;
animated_mcs = [];
animations = ['1'];
loopers = [];

var item_inited:Boolean;
var item_ran:Boolean;

var pole:MovieClip;
var note:MovieClip;
var sign:MovieClip;

var user_config_exclusions:Array = ['note'];

var config_option_names:Object = {
	pole: 'Pole',
	sign: 'Sign',
	size: 'Size'
}

var config_options:Object = {
	size: ['Tall','Medium','Short'],
	note: ['show','hide'],
	pole: ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25'],
	sign: ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29']
}

var default_config:Object;

if (!item_inited) itemInit();
function itemInit():void {
	myAnim = '1';
	
	pole = animatee.poleContainer_mc.getChildAt(0) as MovieClip;
	sign = animatee.signContainer_mc.getChildAt(0) as MovieClip;
	note = animatee.noteContainer_mc.getChildAt(0) as MovieClip;
	
	if (true) {
		var temp_ob4:Object = {};
		var index:int = 0;
		for (var k:String in config_options) {
			var which:int = index
			if (which >= config_options[k].length) which = config_options[k].length-1
			//trace(k+' '+which+' '+config_options[k][which]);
			temp_ob4[k] = config_options[k][which]
		}
		
		default_config = temp_ob4;
		initializehead(temp_ob4);
	}
	
	item_inited = true;
}

//do_trace = true;
itemRun()
function itemRun():void {
	if (item_ran) return;
	stopAll();
	//trackFrames();
	item_ran = true;	
}

function initializehead(ob:Object) {
	log(112, 'initializehead '+ob)
	if (!ob) return;
	
	pole = addArticleToContainer('pole'+ob.size+'_'+ob.pole, animatee, 'poleContainer_mc');
	sign = addArticleToContainer('sign_'+ob.sign, animatee, 'signContainer_mc');
	note = addArticleToContainer('signNote_'+ob.sign, animatee, 'noteContainer_mc');
	
	if (ob.size == 'Short') {
		animatee.signContainer_mc.y = animatee.noteContainer_mc.y = 129;
	} else if (ob.size == 'Medium') {
		animatee.signContainer_mc.y = animatee.noteContainer_mc.y = 64;
	} else if (ob.size == 'Tall') {
		animatee.signContainer_mc.y = animatee.noteContainer_mc.y = 8;
	}
	
	animatee.noteContainer_mc.visible = (ob.note == 'show');
}
