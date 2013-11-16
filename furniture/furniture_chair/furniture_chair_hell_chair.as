import flash.system.Security;
import flash.system.ApplicationDomain;
Security.allowDomain('*');
var loopers:Array;
var preloads:Array;
var loop_froms:Object;
var frame_padd:int;
var asset_provider:MovieClip;
var console:*;
var do_trace:Boolean;

var all_inited:Boolean;
if (!all_inited) {
	do_trace = false;
	loopers = [];
	preloads = [];
	loop_froms = {};
	frame_padd = 0;
	asset_provider = this;
	all_inited = true;
}

function assetExists(class_name:String):Boolean {
	if (!ApplicationDomain.currentDomain) return false;
	// TODO: find out why asset_provider.loaderInfo.applicationDomain is empty when referring to self as asset_provider
	//if (asset_provider.loaderInfo.applicationDomain.hasDefinition(class_name)) return true;
	if (ApplicationDomain.currentDomain.hasDefinition(class_name)) return true;
	return false;
}

function setAssetProvider(provider:MovieClip):void {
	asset_provider = provider;
}

function getAssetByName(class_name:String):MovieClip {
	
	if (assetExists(class_name)) {
		var C:Class
		// TODO: see note in assetExists
		//C = asset_provider.loaderInfo.applicationDomain.getDefinition(class_name) as Class;
		C = ApplicationDomain.currentDomain.getDefinition(class_name) as Class;
		return new C();
	}

	if (class_name && class_name.indexOf('none') != class_name.length-4 && class_name.indexOf('null') != class_name.length-4) {
		warn('getAssetByName unable to find class named "'+class_name+'"');
	}
	return null; //new MovieClip(); // pass a blank one, so we always have a child
	
}

function setConsole(console:*):void {
	this.console = console;
}

function getFrameLabels(mc:MovieClip):String {
	if (!mc) return '';
	var str:String = '[';
	var labels:Array = mc.currentLabels;
	for (var i:uint = 0; i < labels.length; i++) {
		str+= labels[i].name+' ';
	}
	return str+']';
}

function info(v:*) {
	if (console && console.info) {
		console.info(v);
	} else {
		if (do_trace) trace('INFO: '+v)
	}
}

function warn(v:*) {
	if (console && console.warn) {
		console.warn(v);
	} else {
		if (do_trace) trace('WARN: '+v)
	}
}

function error(v:*) {
	if (console && console.error) {
		console.error(v);
	} else {
		if (do_trace) trace('ERROR: '+v)
	}
}

function dir(v:*) {
	if (console && console.dir) {
		console.dir(v);
	} else {
		if (do_trace) trace('DIR: '+v)
	}
}

function log(pri:*, v:*) {
	if (console && console.log) {
		console.log(pri, v);
	} else {
		if (do_trace) trace('LOG '+pri+': '+v)
	}
}


function LogCoords(DO:DisplayObject, max_level:int):void {
		
	function deepTrace(obj:DisplayObject, max_level:int=10, level:int=0):String {
		var tabs:String = "";
		var str:String;
		for (var i:int = 0; i < level; i++, tabs += "-"){};
		if (!obj ) {
			 str = tabs+'NO OBJ?\r';
		} else {
			var classname:String = getQualifiedClassName(obj);
			if (classname.indexOf('::') > -1) classname = classname.split('::')[1];
			str = tabs+'x:'+obj.x+' y:'+obj.y+' scaleX:'+obj.scaleX+' scaleY:'+obj.scaleY+' w:'+obj.width+' h:'+obj.height+' sr:'+obj.scrollRect+' cacheAsBitmap:'+obj.cacheAsBitmap+' name:'+obj.name+' '+classname+'\r'
			
			if (level < max_level && obj.hasOwnProperty('numChildren')) {
				for (var k:int;k<DisplayObjectContainer(obj).numChildren;k++) {
					str+= deepTrace(DisplayObjectContainer(obj).getChildAt(k), max_level, level+1);
				}
			}
		}
		
		return str;
	}
	if (!DO) {
		trace('null DO');
		return;
	}
	trace('\r'+deepTrace(DO, max_level));
}




		