    var item_inited:Boolean;
    var item_ran:Boolean;
     
    var house_mc:MovieClip;
    var base:MovieClip;
    var door:MovieClip;
    var entrance:MovieClip;
    var ground:MovieClip;
    var roof:MovieClip;
    var siding:MovieClip;
     
    var config_options:Object;
	var config_option_names:Object;
     
    itemInit();
     
    function itemInit():void {
            if (item_inited) return;
            animatee = this;
            animated_mcs = [];
            animations = ['1'];
            loopers = [];
            myAnim = '1';
        
        config_option_names = {
                base: 'Base',
                door: 'Door',
                entrance: 'Portico',
                ground: 'Ground',
                roof: 'Roof',
                siding: 'Siding'
        }
            
            config_options = {
                    base: [
                            'base_grey',
                            'base_mud',
                            'base_mud_black',
                            'base_rocks',
                            'base_stone',
							'base_empty'
                    ],
					door: [
							'door_RedStone',
                            'door_BrownStone',
                            'door_PurpleStone',
                            'door_Blue',
                            'door_pink',
                            'door_PurpleRound',
							'door_RedGreen',
							'door_white'
                    ],
                    entrance: [
                            'entrance_Blue',
                            'entrance_GreyPurple',
                            'entrance_log',
                            'entrance_Moss',
							'entrance_moss_black',
                            'entrance_PinkFlowers',
                            'entrance_Purple',
                            'entrance_PurpleMushrooms',
							'entrance_vines',
							'entrance_white'
                    ],
                    ground: [
                            'groundstep_footstone',
                            'groundstep_rocks',
							'groundstep_rocks_black',
							'groundstep_welcome',
							'groundstep_welcome_white'
                    ],
                    roof: [
                            'roof_GrassGreenMushroom',
                            'roof_GrassPink',
                            'roof_GrassYellow',
                            'roof_HutHay',
                            'roof_HutMint',
                            'roof_HutPurple',
							'roof_hut_white',
                            'roof_TuffBlue',
							'roof_TuffCyan',
							'roof_tuff_black'
                    ],
                    siding: [
                            'siding_BlueStone',
                            'siding_GrayStone',
                            'siding_Stone',
                            'siding_StonePinkMoss',
                            'siding_StoneYellowMoss',
							'siding_white',
							'siding_mud_black',
                            'siding_PurpleMud'
                    ]
                   
            }
           
            house_mc = maincontainer_mc.house_mc;
            base = house_mc.baseContainer_mc.getChildAt(0) as MovieClip;
			door = house_mc.doorContainer_mc.getChildAt(0) as MovieClip;
            entrance = house_mc.entranceContainer_mc.getChildAt(0) as MovieClip;
            ground = house_mc.groundContainer_mc.getChildAt(0) as MovieClip;
            roof = house_mc.roofContainer_mc.getChildAt(0) as MovieClip;
            siding = house_mc.sidingContainer_mc.getChildAt(0) as MovieClip;
           
           
            if (true) {
                    var temp_ob4:Object = {};
                    var index:int = 1;
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
     
    //itemRun()
     
    function itemRun():void {
            if (item_ran) return;
            //do_trace = true
            // DEFAULT!
           
            //stopAll();
            //trackFrames();
            //playAnimation('warriorPose');
            //playAnimationSeq(['idle']);
            item_ran = true;
            //LogCoords(animatee, 20)
           
    }
     
     
     
    function initializehead(ob:Object) {
            log(112, 'initializehead '+ob)
            if (!ob) return;
            base = addArticleToContainer(ob.base, house_mc, 'baseContainer_mc') || base;
            door = addArticleToContainer(ob.door, house_mc, 'doorContainer_mc') || door;
            entrance = addArticleToContainer(ob.entrance, house_mc, 'entranceContainer_mc') || entrance;
            ground = addArticleToContainer(ob.ground, house_mc, 'groundContainer_mc') || ground;
            roof = addArticleToContainer(ob.roof, house_mc, 'roofContainer_mc') || roof;
            siding = addArticleToContainer(ob.siding, house_mc, 'sidingContainer_mc') || siding;
    } 