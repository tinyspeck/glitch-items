animatee = this;
animations = ['1'];
loopers = [];

var tree_mcs:Array = ['tree1','tree2','tree3','tree4'];

var config_options:Object = {
        maturity: [1,2,3,4,5,6],
        variant: [1,2,3,4]
}

var item_inited:Boolean;
var item_ran:Boolean;

if (!item_inited) itemInit();

function itemInit():void {
        myAnim = '1';
        for (var i:int;i<tree_mcs.length;i++) {
                if (this[tree_mcs[i]]) this[tree_mcs[i]].stop();
        }
        stopAll();
        item_inited = true;
}

//itemRun()
function itemRun():void {
        if (item_ran) return;
        
        // DEFAULT!
        var temp_ob4:Object = {
                variant: 1,
                maturity: 1
        }
        
        initializehead(temp_ob4);
        trackFrames();
        playAnimation(myAnim);
        item_ran = true;
}

function initializehead(ob:Object) {
		log(112, 'initializehead '+ob)
        if (!ob) return;
        
        for (var i:int;i<tree_mcs.length;i++) {
                if (this[tree_mcs[i]] && this[tree_mcs[i]].parent) this[tree_mcs[i]].parent.removeChild(this[tree_mcs[i]]);     
        }

		var mc:MovieClip = tree1;

		var variant_val = (ob.hasOwnProperty('variant') && ob.variant > 0 && ob.variant < 5) ? ob.variant : 1;
		var maturity_val = (ob.hasOwnProperty('maturity') && ob.maturity > 0 && ob.maturity < 7) ? ob.maturity : 1;
        
		if (variant_val == 2){
			mc = tree2;
		} else if (variant_val == 3) {
			mc = tree3;
		} else if (variant_val == 4){
			mc = tree4;
		}
		
	    if (!mc) return; 
        
        mc.gotoAndStop(parseInt(maturity_val) || 1);
        
        this.addChild(mc);
      
}