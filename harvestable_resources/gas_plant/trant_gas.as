
var tree:*;
var trees:Array = [
	treem1,
	treem2,
	treem3,
	treem4,
	treem5,
	treem6,
	treem7,
	treem8,
	treem9,
	treem10
];

function updateTrantDisplay():void {
	for (var t:int=0;t<trees.length;t++) {
		if (trees[t].parent) trees[t].parent.removeChild(trees[t]);
	}
	
	// maturity
	tree = addChild(trees[maturity-1]);
	
	// health
	tree.gotoAndStop(11 - health);
	
	// fruit
	var mSlots:Array = fruitPosArray(maturity);
	var slots:int = mSlots[health-1];
	if (slots > 0){
	
		var i:int, il:String, imc:MovieClip;
		var f_amt:int = Math.ceil(fruit_amt * slots);
		for (i=1; i <= slots; i++){
			il = "flask_" + String(i);
			if (tree[il] != undefined){
				imc = tree[il] as MovieClip;
				imc.visible = (Boolean(f_amt > 0));
				f_amt--;
			}
		}
	}
	
	// whatever else
	
	
	
	stop();
}

setState({h:1, m:6, f_cap:10, f_num:5});

/*addEventListener(Event.ENTER_FRAME, function():void {
	health++;
	if (health>10) health = 1; 
	setState({h:health, m:String(Math.floor(Math.random()*10)+1), f_cap:String(Math.floor(Math.random()*100)+1), f_num:String(Math.floor(Math.random()*100)+1), seed:0.487555876});
});*/

function fruitPosArray(i:int):Array
{
	switch (i){
		case 1:
		return [0,0,0,0,0,0,0,0,0,0];
		case 2:
		return [0,0,0,0,0,0,0,0,0,0];
		case 3:
		return [0,0,0,0,0,0,0,0,0,0];
		case 4:
		return [0,0,0,0,0,1,1,2,2,3];
		case 5:
		return [0,0,0,0,1,1,2,3,3,4];
		case 6:
		return [0,0,0,0,1,2,3,4,5,6];
		case 7:
		return [0,0,0,2,3,4,5,6,7,8];
		case 8:
		return [0,0,0,2,3,4,5,6,7,11];
		case 9:
		return [0,0,0,2,3,4,5,6,7,13];
		case 10:
		return [0,0,0,3,4,5,6,7,8,16];
		default:
		break;
	}
	
	return [0,0,0,0,0,0,0,0,0,0];
	
}

