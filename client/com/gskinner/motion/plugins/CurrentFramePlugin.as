﻿package com.gskinner.motion.plugins {		import com.gskinner.motion.GTween;	import com.gskinner.motion.plugins.IGTweenPlugin;		public class CurrentFramePlugin implements IGTweenPlugin {				public static var enabled:Boolean=true;				protected static var instance:CurrentFramePlugin;				public static function install():void {			if (instance) { return; }			instance = new CurrentFramePlugin();			GTween.installPlugin(instance,"currentFrame");		}				public function init(tween:GTween, name:String, value:Number):Number {			return value;		}				public function tween(tween:GTween, name:String, value:Number, initValue:Number, rangeValue:Number, ratio:Number, end:Boolean):Number {			if (!(tween.pluginData.CurrentFrameEnabled || enabled)) { return NaN; }						var frame:uint = Math.round(initValue+rangeValue*ratio);			if (tween.target.currentFrame != frame) {				tween.target.gotoAndStop(frame);			}			return NaN;		}			}	}