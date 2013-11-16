
var tree:*;
var trees:Array = [
	
	spiceTree_grow1,
	spiceTree_grow2,
	spiceTree_grow3,
	spiceTree_grow4,
	spiceTree_grow5,
	spiceTree_grow6,
	spiceTree_grow7,
	spiceTree_grow8,
	spiceTree_grow9,
	spiceTree_grow10
	
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
	
	
	// whatever else
	var mPos:Array = fruitPosArray(maturity);
	var slots:int = mPos[health-1];
	if (slots > 0) {
	
		var i:int, il:String, imc:MovieClip;
	
		var f_amt:int = Math.ceil(fruit_amt * slots);
	
		for (i=1; i <= slots; i++){
			il = "fruit_" + String(i);
			if (tree[il] != undefined){
			
				imc = tree[il] as MovieClip;
				imc.visible = (Boolean(f_amt > 0));
				f_amt--;
			}
		}
	}
	
	
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
		return [0, 0, 0, 0, 0, 1, 3, 5, 7, 9];
		case 5:
		return [0, 0, 0, 0, 1, 3, 5, 7, 9, 11];
		case 6:
		return [0, 0, 0, 0, 3, 5, 7, 9, 11, 14];
		case 7:
		return [0, 0, 0, 1, 3, 5, 8, 10, 12, 17];
		case 8:
		return [0, 0, 0, 3, 5, 8, 11, 13, 15, 20];
		case 9:
		return [0, 0, 0, 3, 5, 8, 11, 14, 17, 24];
		case 10:
		return [0, 0, 0, 3, 5, 8, 11, 15, 19, 31];
		default:
		break;
	}
	
	return [0,0,0,0,0,0,0,0,0,0];
	
}
