
var tree:*;
var trees:Array = [
	
	bt_grow1,
	bt_grow2,
	bt_grow3,
	bt_grow4,
	bt_grow5,
	bt_grow6,
	bt_grow7,
	bt_grow8,
	bt_grow9,
	bt_grow10
	
];

function updateTrantDisplay():void {
	for (var t:int=0;t<trees.length;t++) {
		if (trees[t].parent) trees[t].parent.removeChild(trees[t]);
	}
	
	// maturity
	tree = addChild(trees[maturity-1]);
	
	// health
	tree.gotoAndPlay(health);
	
	// fruit
	
	
	// whatever else
	var mPos:Array = fruitPosArray(maturity);
	var slots:int = mPos[health-1];
	if (slots > 0){
		var i:int, il:String, imc:MovieClip;
		var f_amt:int = Math.ceil(fruit_amt * slots);
		for (i=1; i <= slots; i++){
				il = "bubble_" + String(i);
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
		return [0, 0, 0, 1, 1, 4, 4, 7, 7, 12];
		case 5:
		return [0, 0, 0, 3, 6, 6, 6, 10, 10, 15];
		case 6:
		return [0, 0, 0, 3, 5, 5, 9, 14, 14, 20];
		case 7:
		return [0, 0, 0, 6, 6, 14, 14, 20, 20, 26];
		case 8:
		return [0, 0, 0, 6, 6, 17, 17, 26, 26, 32];
		case 9:
		return [0, 0, 0, 6, 6, 19, 19, 29, 29, 42];
		case 10:
		return [0, 0, 0, 8, 8, 24, 24, 34, 34, 48];
		default:
		break;
	}
	
	return [0,0,0,0,0,0,0,0,0,0];
	
}
