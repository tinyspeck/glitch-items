
var tree:*;
var trees:Array = [
	grow_1,
	grow_2,
	grow_3,
	grow_4,
	grow_5,
	grow_6,
	grow_7,
	grow_8,
	grow_9,
	grow_10
];

var maxfla:Array = [10, 10, 16, 16, 16, 30, 30, 38, 48, 72];
var maxcherrya:Array = [0,0,0,4,8,10,15,20,25,30];

function updateTrantDisplay():void {
	for (var t:int=0;t<trees.length;t++) {
		if (trees[t].parent) trees[t].parent.removeChild(trees[t]);
	}
	
	// maturity
	tree = addChild(trees[maturity-1]);
	
	// health
	var randomSeed:RandomSeed = new RandomSeed(seed);
	
	var maxf:int = maxfla[maturity - 1];
	var folClip:MovieClip;
	var folName:String;
	var id:int=1;
	var tr:Number;
	var tv:int;
	for (id=1; id <= maxf; id++){
		folName = "fol_"+String(id);
		if (Boolean(tree[folName])){
			folClip = tree[folName];
			if (randomSeed.random() < (id / maxf)){
				tr = 1 - (randomSeed.random() * 2);
			}else{
				tr = 0;
			}
			tv = (health + tr) >> 0;
			tv = (tv < 1) ? 1 : tv;
			tv = (tv > 10) ? 10 : tv;
			folClip.gotoAndStop(tv);
		}
		
	}
	
	// fruit
	if(maturity > 3){
		var maxcherry:int = maxcherrya[maturity - 1];
		var cherryTop:Array = fruitPosArray(maturity);
		var hcmax:int = cherryTop[health - 1];
		var pcmax:int = (fruit_amt * hcmax) >> 0;
		trace(maxcherry)
		for (id=1; id <= maxcherry; id++){
			folName = "cherry_"+String(id);
			if (Boolean(tree[folName])){
				folClip = tree[folName];
			
				if (id > pcmax){
					folClip.visible = false;
					folClip.gotoAndStop(1);
				}else{
					folClip.visible = true;
					tr = id % 3;
					folClip.gotoAndStop(tr + 1);
				}
			}
		
		}
	}
	
	// whatever else
	
	
	
	stop();
}


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
		return [0, 0, 0, 0, 1, 1, 1, 2, 3, 4];
		case 5:
		return [0, 0, 0, 1, 1, 1, 2, 4, 6, 8];
		case 6:
		return [0, 0, 0, 1, 2, 2, 4, 6, 8, 10];
		case 7:
		return [0, 0, 0, 1, 2, 3, 6, 8, 10, 15];
		case 8:
		return [0, 0, 0, 2, 2, 3, 6, 10, 12, 20];
		case 9:
		return [0, 0, 0, 2, 3, 4, 8, 12, 15, 25];
		case 10:
		return [0, 0, 0, 2, 3, 5, 10, 15, 20, 30];
		default:
		break;
	}
	
	return [0,0,0,0,0,0,0,0,0,0];
	
}
setState({m:10,h:8,f_cap:64,seed:0.111119119,f_num:64});

