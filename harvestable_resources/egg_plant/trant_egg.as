
var tree:*;
var trees:Array = [
	maturity0,
	maturity1,
	maturity2,
	maturity3,
	maturity4,
	maturity5,
	maturity6,
	maturity7,
	maturity8,
	maturity9
];

function updateTrantDisplay():void {
	for (var t:int=0;t<trees.length;t++) {
		if (trees[t].parent) trees[t].parent.removeChild(trees[t]);
	}
	
	// maturity
	tree = addChild(trees[maturity-1]);
	
	// health
	tree.gotoAndStop(health);
	
	// fruit
	var slots:int = tree.getFruitingPos(health-1);
	if (slots > 0) {
		var i:int, il:String, imc:MovieClip;		
		var f_amt:int = Math.ceil(fruit_amt * slots);
		for (i=0; i <= slots; i++){
			il = "egg_" + String(i);
			if (tree[il] != undefined){
				
				imc = tree[il] as MovieClip;
				// this is bad! it relies on code be made available on the timeline:
				//imc.showEgg(Boolean(f_amt > 0));
				// this does the same thing
				imc.egg.visible = Boolean(f_amt > 0);
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

