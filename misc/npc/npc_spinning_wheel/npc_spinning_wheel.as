animatee = spinning_wheel; 
animations = ['spin', 'appear', 'green_spin', 'green_spin_end', 'white_spin', 'white_spin_end', 'red_spin', 'red_spin_end', 'disappear']; 
//preloads = ['spin', 'green_spin', 'white_spin', 'red_spin']; 
loopers = ['appear', 'spin', 'green_spin_end', 'white_spin_end', 'red_spin_end'];
loop_froms = {'appear': 19}
myAnim = 'appear';

var item_ran:Boolean;


//itemRun()
function itemRun():void {
	if (item_ran) return;
	trackFrames();
	//playAnimation(myAnim);
	item_ran = true;
}
