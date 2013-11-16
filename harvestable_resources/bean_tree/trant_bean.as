
var tree:*;
var trees:Array = [
	beanTree_grow1,
	beanTree_grow2,
	beanTree_grow3,
	beanTree_grow4,
	beanTree_grow5,
	beanTree_grow6,
	beanTree_grow7,
	beanTree_grow8,
	beanTree_grow9,
	beanTree_grow10
];

function updateTrantDisplay():void {
	for (var t:int=0;t<trees.length;t++) {
		if (trees[t].parent) trees[t].parent.removeChild(trees[t]);
	}
	
	// maturity
	tree = addChild(trees[maturity-1]);
	
	// health
	tree.setHealth(health);
	
	// fruit
	var slots:int = tree.getFruitingPos(health-1);
	if (slots > 0) {
		var i:int, il:String, imc:MovieClip;		
		var f_amt:int = Math.ceil(fruit_amt * slots);
		for (i=1; i <= slots; i++){
			il = "bean_" + String(i);
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
